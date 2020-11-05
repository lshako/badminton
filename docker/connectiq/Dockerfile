FROM ubuntu:latest

LABEL maintainer="matthieu.corageoud@gmail.com"
LABEL version="1.0.0"
LABEL description="ConnectIQ testing environment"

#RUN sudo rm -rf /var/lib/apt/lists/*

#RUN apt-get update && apt-get -y install openjdk-11-jre-headless

RUN apt-get update && apt-get -y install \
    openjdk-11-jre-headless \
    libusb-1.0-0 \
    libwebkitgtk-1.0 \
    wget \
    unzip

RUN rm -rf /var/lib/apt/lists/*

#RUN wget -q http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_amd64.deb -O /tmp/libpng12.deb; \
#    dpkg -i /tmp/libpng12.deb

# Fix missing libpng12
#RUN ln -s /usr/lib/x86_64-linux-gnu/libpng16.so.16 /usr/lib/x86_64-linux-gnu/libpng12.so.0

RUN wget -q http://mirrors.kernel.org/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo8_2.0.3-0ubuntu1.20.04.1_amd64.deb -O /tmp/libjpeg-turbo8.deb; \
    dpkg -i /tmp/libjpeg-turbo8.deb

RUN wget -q http://mirrors.kernel.org/ubuntu/pool/main/libj/libjpeg8-empty/libjpeg8_8c-2ubuntu8_amd64.deb -O /tmp/libjpeg8.deb; \
    dpkg -i /tmp/libjpeg8.deb

# to find the URL of the latest version, go to https://developer.garmin.com/downloads/connect-iq/sdks/sdks.json
RUN wget -q https://developer.garmin.com/downloads/connect-iq/sdks/connectiq-sdk-lin-3.2.3-2020-10-13-c14e609bd.zip -O /tmp/connectiq.zip; \
    unzip /tmp/connectiq.zip -d /opt/connectiq

# TODO find a way to download device related files directy
COPY fenix5 /opt/connectiq/Devices/fenix5

#RUN wget -q http://www.java2s.com/Code/JarDownload/javax.xml/javax.xml.bind.jar.zip -O /tmp/javax.xml.bind.jar.zip; \
#    unzip /tmp/javax.xml.bind.jar.zip -d /opt/connectiq/bin

#RUN sed -i 's#"$MB_HOME"/monkeybrains.jar#"$MB_HOME"/monkeybrains.jar:"$MB_HOME"/javax.xml.bind.jar#' /opt/connectiq/bin/monkeydo

ENV PATH ${PATH}:/opt/connectiq/bin

CMD [ "/bin/bash" ]
#CMD ["monkeyc", "-v"]