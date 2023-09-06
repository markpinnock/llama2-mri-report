# For more information, please refer to https://aka.ms/vscode-docker-python
FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt

WORKDIR /llama2
COPY . /llama2

# If running without docker compose, do:
#   `docker run --gpus all -it <image-name>`
