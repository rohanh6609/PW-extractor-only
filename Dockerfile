FROM python:3.10.8-slim-buster
RUN apt -qq update && apt -qq install -y git wget pv jq python3-dev ffmpeg mediainfo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . .
WORKDIR .
RUN pip3 install -r requirements.txt
CMD gunicorn app:app & python3 main.py
