FROM ubuntu:latest
      
RUN apt-get update \
  && apt-get install -y python3-pip python3-dev git\
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

ADD . /toxic_comments
WORKDIR /toxic_comments

ENV MLFLOW_TRACKING_URI http://localhost:5000/
ENV AWS_ACCESS_KEY_ID some_acsess_key_id
ENV AWS_SECRET_ACCESS_KEY some_secret_access_key

RUN pip install -r requirements_lite.txt

