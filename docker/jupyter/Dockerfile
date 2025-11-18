FROM jupyter/scipy-notebook:latest

USER root

# Installer des dépendances système
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    vim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}

# Copier et installer les requirements
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Installer JupyterLab extensions
RUN pip install --no-cache-dir \
    jupyterlab-git \
    jupyterlab-lsp \
    python-lsp-server

WORKDIR /home/jovyan/work
