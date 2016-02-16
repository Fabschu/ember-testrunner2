FROM ubuntu:14.04
MAINTAINER Sven Lückenbach <sven@lueckenba.ch>

# Install Node
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN apt-get update && \
	apt-get install -y nodejs build-essential automake autoconf git && \
	apt-get clean

# Global deps
RUN npm install -g ember-cli@1.13.15 bower@1.7.1 phantomjs@1.9.19 xo
RUN npm config set loglevel error --global

RUN echo '{ "allow_root": true }' > /root/.bowerrc

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

CMD ["npm", "start"]
