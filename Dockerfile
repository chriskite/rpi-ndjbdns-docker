#
# raspberry pi ndjbdns base image
#
# Installs ndjbdns, but does not run any of
# its services.
#
FROM resin/raspberrypi3-debian:latest
ENV INITSYSTEM on

ADD ndjbdns-1.06.tar.gz /src

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
       apt-get --no-install-recommends install -y build-essential \
    && cd /src/ndjbdns-1.06 \
    && ./configure \
    && make install \
    && apt-get remove -y build-essential \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /src /var/lib/apt/lists/*
