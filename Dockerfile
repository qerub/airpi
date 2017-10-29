FROM resin/rpi-raspbian:jessie

COPY build-package.sh /tmp

RUN /tmp/build-package.sh && rm /tmp/build-package.sh

FROM resin/rpi-raspbian:jessie

COPY configuration /tmp/configuration

COPY --from=0 /tmp/shairport-sync.deb /tmp

RUN run-parts -v --exit-on-error /tmp/configuration && rm -r /tmp/configuration && rm /tmp/shairport-sync.deb

ENV INITSYSTEM on

CMD true