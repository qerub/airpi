#!/bin/sh

set -ex

apt-get update

# Installation of utilities

apt-get install -y alsa-utils

# Installation of Shairport Sync

dpkg -i /tmp/shairport-sync.deb || true

apt-get -f install -y

systemctl enable shairport-sync

# Cleanup

rm -rf /var/lib/apt/lists/*

# Note: apt-get clean is already performed via /etc/apt/apt.conf.d/docker-clean.
