FROM leesangha/u2net as build

FROM nvidia/cuda:11.0-cudnn8-runtime-ubuntu18.04

RUN apt-get update && apt-get install -y \
    python3.7 \
    python3-pip \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev

WORKDIR /app

COPY requirements.txt /app

RUN pip3 install --upgrade pip setuptools
RUN pip3 install -r requirements.txt

RUN mkdir /app/saved_models
COPY --from=build /app/saved_models/ /app/saved_models

COPY . /app

EXPOSE 80
CMD python3 app.py