FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

RUN git clone -b stable https://github.com/alexbers/mtprotoproxy.git /app

RUN pip install --no-cache-dir uvloop cryptography pyaes

EXPOSE 443

CMD ["python3", "/app/mtprotoproxy.py"]
