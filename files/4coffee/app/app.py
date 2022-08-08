from datetime import datetime
from flask import Flask, jsonify, request, make_response
from elasticsearch import Elasticsearch
import os 
from dotenv import load_dotenv
from elasticapm.contrib.flask import ElasticAPM


load_dotenv()

ES_PWD = os.getenv("ES_PWD") 

es = Elasticsearch(
    "https://192.168.63.10:9200",
    basic_auth=("elastic", ES_PWD),
    verify_certs=False

)

app = Flask(__name__)

app.config['ELASTIC_APM'] = {
  'SERVICE_NAME': 'flaskApp',
  'SERVER_URL': 'http://192.168.63.20:8200',
  'ENVIRONMENT': 'production',
}


apm = ElasticAPM(app)


@app.route('/', methods=['GET'])
def home():
    return '<html><body><h1>Bem vindo ao 4Coffee</h1></body></html>'


@app.route('/items/all', methods=['GET'])
def index():
    results = es.search(index='cafeteria', query={"match_all":{}})
    return jsonify(results['hits']['hits'])

@app.route('/insert_data', methods=['POST'])
def insert_data():
    request_data = request.get_json()
    bebida = request_data['bebida']
    preço = request_data['preço']
    açucar = request_data['açucar']
    id = request_data['id']

    body = {
        'id': id,
        'bebida': bebida,
        'preço': preço,
        'açucar': açucar,
        'timestamp': datetime.now()
    }

    result = es.index(index='cafeteria', id=id, body=body)

    return jsonify(body)

@app.route('/search', methods=['POST'])
def search():
    keyword = request.form['keyword']

    body = {
        "query": {
            "multi_match": {
                "query": keyword,
                "fields": ["bebida"]
            }
        }
    }

    res = es.search(index="cafeteria", body=body)

    return jsonify(res['hits']['hits'])
