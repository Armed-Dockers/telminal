FROM python:3.9-slim

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
  gettext-base

RUN pip3 install -r requirements.txt
RUN pip3 install telminal

# Copy the updated JSON file to the container
COPY config.example.json /usr/local/lib/python3.9/site-packages/telminal/config.json
RUN sed -i "s/{{API_ID}}/$API_ID/g; s/{{API_HASH}}/$API_HASH/g; s/{{TOKEN}}/$TOKEN/g; s/{{ADMINS}}/$ADMINS/g" /usr/local/lib/python3.9/site-packages/telminal/config.json

CMD ["telminal"]
