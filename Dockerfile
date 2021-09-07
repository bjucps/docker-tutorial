FROM python:3.9-buster

# needed for postgresql
RUN apt update && apt install -y postgresql-client

COPY . /app
WORKDIR /app

RUN pip3 install -r requirements.txt
RUN flask db init

CMD flask db migrate && flask db upgrade && python3 app.py