FROM ubuntu:trusty
MAINTAINER Markus Kienast <mark@trickkiste.at>
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /tmp
WORKDIR /tmp

# This container can be used as basis for builds, which require the existance of Blackmagic Decklink drivers and headers

# Add multiverse repos
RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/sources.list && echo "deb-src http://archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/sources.list && echo "deb http://archive.ubuntu.com/ubuntu/ trusty-security multiverse" >> /etc/apt/sources.list && echo "deb-src http://archive.ubuntu.com/ubuntu/ trusty-security multiverse" >> /etc/apt/sources.list

# Update System
RUN apt-get update && apt-get -y dist-upgrade && rm -rf /var/lib/apt/lists/* && apt-get autoclean && apt-get clean && apt-get autoremove

# Install Blackmagic drives and libs
RUN apt-get update && apt-get install -y curl wget dkms linux-headers-generic libjpeg62 libgl1-mesa-glx libxml2 && wget --quiet -O /tmp/Blackmagic_Desktop_Video_Linux_10.1.1.tar.gz http://software.blackmagicdesign.com/DesktopVideo/Blackmagic_Desktop_Video_Linux_10.1.1.tar.gz && cd /tmp && tar xvfz /tmp/Blackmagic_Desktop_Video_Linux_10.1.1.tar.gz && dpkg -i /tmp/DesktopVideo_10.1.1/deb/amd64/desktopvideo_10.1.1a26_amd64.deb && dkms install -v 10.1.1a26 -m blackmagic -k $(apt-cache --no-all-versions show linux-headers-generic | grep Depends | sed -n -e 's/^.*linux-headers-//p') && dkms install -v 10.1.1a26 -m blackmagic-io -k $(apt-cache --no-all-versions show linux-headers-generic | grep Depends | sed -n -e 's/^.*linux-headers-//p') && rm -rf /var/lib/apt/lists/* && apt-get autoclean && apt-get clean && apt-get autoremove

#RUN     useradd -m default

#WORKDIR /home/default

#USER    default
#ENV     HOME /home/default

#ENTRYPOINT ["/usr/bin/obecli"]