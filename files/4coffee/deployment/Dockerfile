FROM python:3.9.13-bullseye
WORKDIR /usr/src/app

ADD app/requirements.txt /usr/src/app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

ADD app/ /usr/src/app
