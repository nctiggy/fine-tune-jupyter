FROM quay.io/jupyter/all-spark-notebook:latest

ADD requirements.txt /requirements.txt

RUN pip install -r /requirements.txt
