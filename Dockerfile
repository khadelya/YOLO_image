FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
  git \
  python \
  && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ultralytics/yolov5
WORKDIR yolov5
RUN pip install -r requirements.txt
