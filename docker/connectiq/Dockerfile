#FROM circleci/openjdk:latest
FROM circleci/buildpack-deps:bionic

LABEL maintainer="matthieu.corageoud@gmail.com"
LABEL version="1.0.0"
LABEL description="ConnectIQ testing environment"

#RUN sudo rm -rf /var/lib/apt/lists/*

#RUN apt-get update && apt-get -y install openjdk-11-jre-headless


RUN sudo apt-get update && sudo apt-get -y install \
	openjdk-11-jre-headless \
    libusb-1.0-0 \
    libwebkitgtk-1.0

RUN sudo rm -rf /var/lib/apt/lists/*

RUN wget -q http://mirrors.edge.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb -O /tmp/libpng12.deb; \
    sudo dpkg -i /tmp/libpng12.deb

RUN wget -q http://mirrors.edge.kernel.org/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8_2.0.1-0ubuntu2_amd64.deb -O /tmp/libjpeg-turbo8.deb; \
    sudo dpkg -i /tmp/libjpeg-turbo8.deb

RUN wget -q http://mirrors.edge.kernel.org/ubuntu/pool/main/libj/libjpeg8-empty/libjpeg8_8c-2ubuntu8_amd64.deb -O /tmp/libjpeg8.deb; \
    sudo dpkg -i /tmp/libjpeg8.deb

RUN wget -q https://developer.garmin.com/downloads/connect-iq/beta/sdks/connectiq-sdk-lin-3.1.0.Beta3-2019-06-14-bf21fff97.zip -O /tmp/connectiq.zip; \
    sudo unzip /tmp/connectiq.zip -d /opt/connectiq;

RUN wget -q http://www.java2s.com/Code/JarDownload/javax.xml/javax.xml.bind.jar.zip -O /tmp/javax.xml.bind.jar.zip; \
    sudo unzip /tmp/javax.xml.bind.jar.zip -d /opt/connectiq/bin;

RUN sudo sed -i 's#"$MB_HOME"/monkeybrains.jar#"$MB_HOME"/monkeybrains.jar:"$MB_HOME"/javax.xml.bind.jar#' /opt/connectiq/bin/monkeydo

ENV PATH ${PATH}:/opt/connectiq/bin

CMD [ "/bin/bash" ]
