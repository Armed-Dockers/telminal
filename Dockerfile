FROM phusion/baseimage:jammy-1.0.1

RUN mkdir /telminal
WORKDIR /telminal
COPY . /telminal

RUN echo "---- INSTALL RUNTIME PACKAGES ----" && \
  apt-get -y update && \
  apt-get install -y \
  chromium-driver \
  gconf-service \
  libasound2 \
  libatk1.0-0 \
  libc6 \
  libcairo2 \ 
  libcups2 \ 
  libdbus-1-3 \ 
  libexpat1 \
  libfontconfig1 \
  libgcc1 \
  libgconf-2-4 \
  libgdk-pixbuf2.0-0 \
  libglib2.0-0 \
  libgtk-3-0 \
  libnspr4 \
  libpango-1.0-0 \
  libpangocairo-1.0-0 \
  libstdc++6 \
  libx11-6 \
  libx11-xcb1 \
  libxcb1 \
  libxcomposite1 \
  libxcursor1 \
  libxdamage1 \
  libxext6 \
  libxfixes3 \
  libxi6 \
  libxrandr2 \
  libxrender1 \
  libxss1 \
  libxtst6 \
  ca-certificates \
  fonts-liberation \
  libappindicator1 \
  libnss3 \
  lsb-release \
  xdg-utils \
  wget \
  gettext-base \
  python3 \
  python3-pip

RUN pip3 install -r requirements.txt
RUN pip3 install telminal
COPY config.json /usr/local/lib/python3.10/dist-packages/telminal/config.json

CMD ["telminal"]
