#!/bin/sh

set -ex

cd /tmp

cat > /etc/apt/sources.list.d/testing-src.list <<-EOF
  deb-src http://deb.debian.org/debian testing main
  deb-src http://deb.debian.org/debian testing-updates main
  deb-src http://security.debian.org/  testing/updates main
EOF

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B48AD6246925553
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7638D0442B90D010
# (Needed since we're grabbing Shairport Sync from Debian.)

apt-get update

apt-get install -y build-essential

apt-get source shairport-sync

apt-get build-dep -y shairport-sync

cd shairport-sync-*/

dpkg-buildpackage -us -uc -nc

cd ..

ln shairport-sync_*.deb shairport-sync.deb