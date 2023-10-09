FROM python:3.9-slim-buster

ENV API_ID=2222
ENV API_HASH=5432
ENV TOKEN=1234
ENV ADMINS=8888

RUN mkdir /telminal
WORKDIR /telminal
COPY . /telminal
RUN pip3 install -r requirements.txt
RUN pip3 install telminal
COPY config.json /usr/local/lib/python3.9/site-packages/telminal/config.json

CMD ["telminal"]