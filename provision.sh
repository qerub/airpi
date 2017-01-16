#!/bin/sh

URL="https://s3-eu-west-1.amazonaws.com/airplayer/shairport-sync_2.8.4-1~bpo8%2B1raspbian_armhf.deb"

set -ex

apt-get update

apt-get install -y curl alsa-utils

curl -o /tmp/shairport-sync.deb $URL

dpkg -i /tmp/shairport-sync.deb || true

apt-get -f install

systemctl enable shairport-sync

# Cleanup

rm /tmp/shairport-sync.deb

rm -rf /var/lib/apt/lists/*
