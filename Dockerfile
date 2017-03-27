FROM ubuntu:14.04
MAINTAINER Fabian Schulte <fabian.schulte@neomatt.de>

# Install Node
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
RUN apt-get update && \
	apt-get install -y nodejs build-essential libfontconfig libfreetype6 libfontconfig1-dev libssl-dev libxft-dev automake autoconf git && \
	apt-get clean

# Global deps
RUN npm install -g ember-cli@1.13.15 bower@1.7.1 phantomjs@1.9.19 xo cordova-icon cordova-splash lodash@">=4.3.0" elementtree@">=0.1.6" plist@">=1.2.0" xcode@">=0.8.9" colors@">=1.1.2" shelljs@">=0.7.0" tostr@">=0.1.0" jshint@">=2.6.0" got@">=6.5.0"
RUN npm config set loglevel error --global

RUN echo '{ "allow_root": true }' > /root/.bowerrc

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

CMD ["npm", "start"]
