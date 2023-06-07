FROM pytorch/pytorch:latest

RUN apt-get update && apt-get install -y curl tar
COPY requirements.txt /root/
RUN pip install -U pip && pip install -r /root/requirements.txt
CMD jupyter lab --ip 0.0.0.0 --port 8888 --allow-root
