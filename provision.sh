#!/bin/sh

URL="https://s3-eu-west-1.amazonaws.com/airplayer/shairport-sync_2.8.4-1~bpo8%2B1raspbian_armhf.deb"
CHECKSUM="a57e56593da769222834e3f65d1fbea4f119f53b96d27a61148d245a65213ed7"

set -ex

apt-get update

apt-get install -y curl alsa-utils

curl --fail --silent --show-error --location --output /tmp/shairport-sync.deb "$URL"

echo "$CHECKSUM  /tmp/shairport-sync.deb" | sha256sum -c

dpkg -i /tmp/shairport-sync.deb || true

apt-get -f install

systemctl enable shairport-sync

# Cleanup

rm /tmp/shairport-sync.deb

rm -rf /var/lib/apt/lists/*
