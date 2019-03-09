FROM ubuntu:16.04
MAINTAINER Johan Bregell

ENV DEBIAN_FRONTEND=noninteractive

RUN set -x \
	&& apt-get update \
	&& apt-get install -y --no-install-recommends --no-install-suggests \
		lib32stdc++6 \
		lib32gcc1 \
		wget \
		ca-certificates \
		apt-utils \
	&& useradd -m steam \
	&& su steam -c \
		"mkdir -p /home/steam/steamcmd \
		&& cd /home/steam/steamcmd \
		&& wget -qO- 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxf -" \
        && apt-get clean autoclean \
        && apt-get autoremove -y \
        && rm -rf /var/lib/{apt,dpkg,cache,log}/

# Switch to user steam
USER steam

VOLUME /home/steam/steamcmd
