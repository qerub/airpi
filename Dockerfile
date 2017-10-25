FROM resin/rpi-raspbian:jessie

COPY build-package.sh /tmp

RUN /tmp/build-package.sh && rm /tmp/build-package.sh

FROM resin/rpi-raspbian:jessie

COPY provision.sh /tmp

COPY --from=0 /tmp/shairport-sync.deb /tmp

RUN /tmp/provision.sh && rm /tmp/provision.sh && rm /tmp/shairport-sync.deb

COPY entry.airpi.sh /usr/bin

ENTRYPOINT ["/usr/bin/entry.airpi.sh"]

ENV INITSYSTEM on

CMD true