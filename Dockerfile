FROM python:3.6-alpine

RUN adduser -D pages

WORKDIR /home/serhii
COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN venv/bin/pip install -r requirements.txt
RUN venv/bin/pip install gunicorn

#COPY app app
#COPY migrations migrations
COPY templates templates

COPY pages.py  config.py boot.sh ./
RUN chmod +x boot.sh

ENV FLASK_APP pages.py

RUN chown -R pages:pages ./
USER pages

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
