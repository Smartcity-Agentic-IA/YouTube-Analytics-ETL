FROM apache/airflow:2.7.3-python3.11

USER root

# Installer des dépendances système si nécessaire
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER airflow

# Copier et installer les requirements
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

# Installer des providers Airflow supplémentaires
RUN pip install --no-cache-dir \
    apache-airflow-providers-postgres \
    apache-airflow-providers-celery \
    apache-airflow-providers-redis

WORKDIR /opt/airflow
