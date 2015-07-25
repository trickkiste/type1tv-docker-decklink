FROM ubuntu:trusty
MAINTAINER Markus Kienast <mark@trickkiste.at>
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /tmp
WORKDIR /tmp

# This container can be used as basis for builds, which require the existance of Blackmagic Decklink drivers and headers

# Install Blackmagic drives and libs
RUN apt-get update && \
    apt-get install -y wget libjpeg62 libgl1-mesa-glx libxml2 && \
    wget --quiet -O /tmp/Blackmagic_Desktop_Video_Linux_10.1.1.tar.gz http://software.blackmagicdesign.com/DesktopVideo/Blackmagic_Desktop_Video_Linux_10.1.1.tar.gz && \
    cd /tmp && tar xvfz /tmp/Blackmagic_Desktop_Video_Linux_10.1.1.tar.gz && \
    dpkg --force-depends -i /tmp/DesktopVideo_10.1.1/deb/amd64/desktopvideo_10.1.1a26_amd64.deb && \
    apt-get -y -f install && \
    apt-get remove -y wget && \
    apt-get -y autoclean && apt-get -y clean && apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp
