# Base image Ubuntu 12.04
FROM ubuntu:precise

MAINTAINER Gian Marco Sibilla <gm.sibilla@gmail.com>

RUN echo "# TinyOS" >> /etc/apt/sources.list
RUN echo "deb http://tinyos.stanford.edu/tinyos/dists/ubuntu lucid main" >> /etc/apt/sources.list
RUN echo "deb http://tinyos.stanford.edu/tinyos/dists/ubuntu maverick main" >> /etc/apt/sources.list
RUN echo "deb http://tinyos.stanford.edu/tinyos/dists/ubuntu natty main" >> /etc/apt/sources.list

# Install TinyOS
RUN apt-get update && apt-get install -y --force-yes \
  subversion \
  wget \
  tinyos-2.1.2

# Download and decompress TinyOS sources
RUN wget -O /tmp/tinyos-2_1_2.tar.gz http://github.com/tinyos/tinyos-release/archive/tinyos-2_1_2.tar.gz
RUN mkdir -p /usr/local/opt & tar xf /tmp/tinyos-2_1_2.tar.gz -C /usr/local/opt
RUN mv /usr/local/opt/tinyos-release-tinyos-2_1_2 /usr/local/opt/tinyos-main

# Export environment variables required for TinyOS
ENV TOSROOT="/usr/local/opt/tinyos-main"
ENV TOSDIR="$TOSROOT/tos"
ENV CLASSPATH=$CLASSPATH:$TOSROOT/support/sdk/java
ENV MAKERULES="$TOSROOT/support/make/Makerules"
ENV PYTHONPATH=$PYTHONPATH:$TOSROOT/support/sdk/python

RUN useradd -d /tinyos -g sudo -G dialout -p tinyos tinyos
