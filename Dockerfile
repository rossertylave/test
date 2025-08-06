FROM python:3.8-alpine

WORKDIR /app

COPY . /app

RUN apk upgrade --no-cache && \
apk add --no-cache build-base libpq-dev && \
pip install --no-cache-dir virtualenv && \
virtualenv /venv && \
pip install --no-cache-dir -r requirements.txt

ENV PATH="/venv/bin:$PATH" \
FLASK_APP=app.py \
FLASK_RUN_HOST=0.0.0.0

EXPOSE 5000

CMD ["flask", "run"]
