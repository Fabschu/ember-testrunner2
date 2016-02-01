FROM node:4.2.3
MAINTAINER Sven Lückenbach <sven@lueckenba.ch>

RUN npm install -g ember-cli@1.13.15
RUN npm install -g bower@1.7.1
RUN npm install -g phantomjs@1.9.19
RUN npm config set loglevel error --global

RUN \
	git clone https://github.com/facebook/watchman.git &&\
	cd watchman &&\
	git checkout v3.5.0 &&\
	./autogen.sh &&\
	./configure &&\
	make &&\
	make install

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/ember"]
CMD ["test"]
