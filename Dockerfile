FROM ubuntu:trusty
MAINTAINER Markus Kienast <mark@trickkiste.at>
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /tmp
WORKDIR /tmp

# This container can be used as basis for builds, which require the existance of Blackmagic Decklink drivers and headers

# Install Blackmagic drives and libs
RUN apt-get update && \
    apt-get install -y wget && \
    wget --quiet -O /tmp/Blackmagic_Desktop_Video_Linux_10.2.2.tar.gz \
    http://software.blackmagicdesign.com/DesktopVideo/Blackmagic_Desktop_Video_Linux_10.2.2.tar.gz && \
    cd /tmp && tar xvfz /tmp/Blackmagic_Desktop_Video_Linux_10.2.2.tar.gz && \
    tar xfvz Blackmagic_Desktop_Video_Linux_10.2.2/DesktopVideo_10.2.2/other/x86_64/desktopvideo-10.2.2a8-x86_64.tar.gz &&\
    cp desktopvideo-10.2.2a8-x86_64/usr/lib/libDeckLinkAPI.so /usr/lib/ && \
    cp desktopvideo-10.2.2a8-x86_64/usr/lib/libDeckLinkPreviewAPI.so /usr/lib/ && \
    apt-get remove -y wget && \
    apt-get -y autoclean && apt-get -y clean && apt-get -y autoremove && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp
