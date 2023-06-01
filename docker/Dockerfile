FROM pytorch/pytorch:latest

COPY requirements.txt /root/
RUN pip install -U pip && pip install -r /root/requirements.txt
CMD jupyter lab --ip 0.0.0.0 --port 8888 --allow-root