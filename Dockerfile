FROM ubuntu:16.04
MAINTAINER Johan Bregell

ENV DEBIAN_FRONTEND=noninteractive

USER root
RUN set -x
RUN apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		lib32stdc++6 \
		lib32gcc1 \
		wget \
		ca-certificates \
		apt-utils \
		sed
RUN mkdir -p /home/root/steamcmd \
	&& cd /home/root/steamcmd \
	&& wget -qO- 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxf -
RUN apt-get clean autoclean \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/{apt,dpkg,cache,log}/

VOLUME /home/root/steamcmd
