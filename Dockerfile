FROM alpine:3.14

ENV API_ID=2222
ENV API_HASH=5432
ENV TOKEN=1234
ENV ADMINS=8888

RUN mkdir /telminal
WORKDIR /telminal
COPY . /telminal

RUN apk install chromium-chromedriver python3 py3-pip
RUN python3 -m pip install --upgrade pip
RUN apk install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget
RUN pip3 install -r requirements.txt
RUN pip3 install telminal
RUN chmod +x /telminal/start.sh

CMD ["start.sh"]