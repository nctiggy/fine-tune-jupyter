FROM quay.io/jupyter/all-spark-notebook:latest

COPY ./requirements.txt /tmp/requirements.txt

RUN pip install -r /tmp/requirements.txt
