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
		apt-utils
RUN useradd -m steam
USER steam
RUN mkdir -p /home/steam/steamcmd \
	&& cd /home/steam/steamcmd \
	&& wget -qO- 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxf -
USER root
RUN apt-get clean autoclean \
	&& apt-get autoremove -y \
	&& rm -rf /var/lib/{apt,dpkg,cache,log}/

# Switch to user steam
USER steam

VOLUME /home/steam/steamcmd
