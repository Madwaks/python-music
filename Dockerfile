FROM python:3.9-slim-buster

RUN mkdir /app
WORKDIR /app
RUN apt-get update && \
    apt-get install -y g++ rsync zip openssh-server make && \
    apt-get libasound2 libasound2-plugins libasound2-doc alsa-utils alsa-oss alsamixergui apulse

COPY requirements.txt /app/requirements.txt

RUN pip install -r /app/requirements.txt

COPY main.py /app/.

ENTRYPOINT ["python"]

