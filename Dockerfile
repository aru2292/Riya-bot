FROM python:3.12-slim-bookworm

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    DATA_DIR=/data

RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg libopus0 libsodium23 \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /data

WORKDIR /app

COPY RIYA-UTIL-bot.zip /tmp/RIYA-UTIL-bot.zip

RUN python -m zipfile -e /tmp/RIYA-UTIL-bot.zip /app \
    && rm /tmp/RIYA-UTIL-bot.zip \
    && python -m pip install --no-cache-dir -r requirements.txt

CMD ["python", "-u", "main.py"]svg
