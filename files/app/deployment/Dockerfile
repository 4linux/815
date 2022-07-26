FROM python:3
WORKDIR /usr/src/app

ADD app/requirements.txt /usr/src/app

RUN pip install -r requirements.txt

ADD app/ /usr/src/app
