FROM maven:3.8.6-openjdk-18-slim

COPY . /usr/app

WORKDIR /usr/app

CMD [ "bash" ]