FROM quay.io/jupyter/all-spark-notebook:latest


RUN pip install llama-index \
            llama-index-vector-stores-milvus \
            accelerate \
            intel-extension-for-transformers
