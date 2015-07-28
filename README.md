# docker-decklink
Dockerfile for building an Ubuntu Docker container with the latest Blackmagic Decklink lib /usr/lib/libDeckLinkAPI.so installed.

The actual decklink driver needs to be installed on the host system an the device needs to be mapped into the container with "--device /dev/blackmagic/dv0"

This container is the base image for trickkiste/obe and trickkiste/melted Docker containers. 

libDeckLinkAPI.so seems to be the only thing needed to be installed in order to make OBE and Melted compile and run. If you happen to know differently, please let me know.
