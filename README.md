# Airpi: Shairport Sync for Raspberry Pi via Resin.io

## Setup

1. Register a Resin.io app.
2. Flash your Raspberry Pi with the "firmware" for that app.
3. Define the app environment variable `CONFIGURATION_URL` to point at some Shairport Sync configuration.
4. Push the code in this repository to the one Resin.io has created for your app.

## Known limitations

* External `shairport-sync-*.deb` fetched via cURL is not integrity checked.
