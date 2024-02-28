FROM quay.io/jupyter/all-spark-notebook:latest

ADD requirements.txt /workspace/requirements.txt

RUN pip install -r /workspace/requirements.txt
