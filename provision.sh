#!/bin/sh

URL="https://s3-eu-west-1.amazonaws.com/airplayer/shairport-sync_3.0.2-1~exp1%2Braspbian-jessie_armhf.deb"
CHECKSUM="be69ed5598327c8704f77b6558daf188ec51cb1c648360ba462a0df0fb723230"

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
