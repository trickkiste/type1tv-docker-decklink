FROM ubuntu:trusty
MAINTAINER Markus Kienast <mark@trickkiste.at>
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /tmp
WORKDIR /tmp

# This container can be used as basis for builds, which require the existance of Blackmagic Decklink libs
# The libs are redistributed in this git repo for convenience. If that is prohibited by Blackmagic terms 
# and conditions, please let me know.

# Install Blackmagic libs (not drivers)
COPY desktopvideo-10.2.2a8-x86_64/usr/lib/libDeckLinkAPI.so /usr/lib/
COPY desktopvideo-10.2.2a8-x86_64/usr/lib/libDeckLinkPreviewAPI.so /usr/lib/
