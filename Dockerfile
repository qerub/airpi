FROM resin/rpi-raspbian:jessie

COPY provision.sh /tmp

RUN /tmp/provision.sh && rm /tmp/provision.sh

COPY entry.airpi.sh /usr/bin

ENTRYPOINT ["/usr/bin/entry.airpi.sh"]

ENV INITSYSTEM on