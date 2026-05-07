FROM python:3.11-slim

RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Скачиваем сам прокси
RUN git clone -b stable https://github.com/alexbers/mtprotoproxy.git /app

WORKDIR /app

# Устанавливаем библиотеки
RUN pip install --no-cache-dir uvloop cryptography pyaes

# !!! ВАЖНО: Копируем ВАШ файл настроек поверх стандартного !!!
COPY config.py .

EXPOSE 443

CMD ["python3", "mtprotoproxy.py"]
