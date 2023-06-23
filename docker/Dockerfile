FROM nvcr.io/nvidia/pytorch:23.05-py3

WORKDIR /workspace

ENV TZ=Asia/Tokyo \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_NO_CACHE_DIR=on \
    CERT_PATH=/etc/ssl/certs/NCVC-SSL-Decryption-CA-trust.pem \
    CERT_DIR=/etc/ssl/certs/
ENV SSL_CERT_FILE=${CERT_PATH} \ 
    SSL_CERT_DIR=${CERT_DIR} \
    REQUESTS_CA_BUNDLE=${CERT_PATH}

# install and setup root certificates
RUN mkdir -p /usr/share/ca-certificates/ncvc
RUN curl -o /usr/share/ca-certificates/ncvc/NCVC-SSL-Decryption-CA-trust.crt https://portal.ncvc.go.jp/wp-content/uploads/NCVC-SSL-Decryption-CA-trust.crt
RUN echo "ncvc/NCVC-SSL-Decryption-CA-trust.crt" >> /etc/ca-certificates.conf
RUN update-ca-certificates

# install graphviz
RUN apt-get update && apt-get install -y graphviz

# ssl
RUN echo "Options = UnsafeLegacyRenegotiation" >> /etc/ssl/openssl.cnf

# setup pip.conf and install packages
RUN { \
       echo "[global]"; \
       echo "no-cache-dir = true"; \
       echo "index-url = https://pypi.org/simple"; \
       echo "trusted-host = pypi.python.org pypi.org files.pythonhosted.org"; \
       echo "cert = /usr/share/ca-certificates/ncvc/NCVC-SSL-Decryption-CA-trust.crt"; \
    } | tee /usr/pip.conf /root/.config/pip/pip.conf /root/.pip/pip.conf /etc/pip.conf /etc/xdg/pip/pip.conf
COPY requirements.txt /root/
RUN pip install -U pip && pip install -r /root/requirements.txt
