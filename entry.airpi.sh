#!/bin/sh

set -e

if [ -z "$CONFIGURATION_URL" ]; then
  echo "Environment variable CONFIGURATION_URL not set" >&2
  exit 1
fi

curl --fail --silent --show-error --location --output /etc/shairport-sync.conf "$CONFIGURATION_URL"

exec /usr/bin/entry.sh "$@"