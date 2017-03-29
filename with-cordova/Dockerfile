FROM fabschu/ember-testrunner
MAINTAINER Fabian Schulte <fabian.schulte@neomatt.de>

RUN npm install -g cordova

# From webratio/java
RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update -y && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java8-installer && \
    apt-get remove software-properties-common -y && \
    apt-get autoremove -y && \
    apt-get clean
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# From webratio/android-sdk
# Installs i386 architecture required for running 32 bit Android tools
RUN dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y wget libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get autoremove -y && \
    apt-get clean
    
ENV ANDROID_SDK_FILENAME android-sdk_r24.2-linux.tgz
ENV ANDROID_SDK_URL http://dl.google.com/android/${ANDROID_SDK_FILENAME}
ENV ANDROID_API_LEVELS android-23
ENV ANDROID_BUILD_TOOLS_VERSION 23.0.1
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
RUN cd /opt && \
	wget -q ${ANDROID_SDK_URL} && \
	tar -xzf ${ANDROID_SDK_FILENAME} && \
	rm ${ANDROID_SDK_FILENAME} && \
	echo y |android update sdk --no-ui -a --filter extra,tools,platform-tools,${ANDROID_API_LEVELS} && \
	echo y |android update sdk --no-ui -a --filter build-tools-23.0.1 && \
	echo y |android update sdk --no-ui -a --filter extra-android-m2repository && \
	echo y |android update sdk --no-ui -a --filter extra-google-m2repository

#install imagemagick
RUN apt-get update
RUN apt-get install -y \
    wget \
    imagemagick 
