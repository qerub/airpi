FROM resin/rpi-raspbian:jessie

COPY build-package.sh /tmp

RUN /tmp/build-package.sh && rm /tmp/build-package.sh

FROM resin/rpi-raspbian:jessie

COPY provision.sh /tmp

COPY --from=0 /tmp/shairport-sync.deb /tmp

RUN /tmp/provision.sh && rm /tmp/provision.sh && rm /tmp/shairport-sync.deb

ENV INITSYSTEM on

CMD true