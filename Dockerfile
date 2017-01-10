FROM resin/rpi-raspbian:jessie

COPY provision.sh /tmp

RUN /tmp/provision.sh && rm /tmp/provision.sh

ENV INITSYSTEM on