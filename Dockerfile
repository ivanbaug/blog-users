# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.10-slim

# Allow statements and log messages to immediately appear in the Knative logs
ENV PYTHONUNBUFFERED True

# Copy local code to the container image.
WORKDIR /app

COPY requirements.txt ./
# Install production dependencies.
RUN apt-get update \
    && apt-get -y install libpq-dev gcc \
    && pip install --no-cache-dir psycopg2==2.9.1 \
    && apt-get remove -y gcc && apt-get -y autoremove \
    && apt-get clean
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["gunicorn", "main:app", "-w", "2", "--threads", "2", "-b", "0.0.0.0:5000"]