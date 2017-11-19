# Resin-based Docker images for Shairport Sync

`Dockerfile` is based on `resin/rpi-raspbian` and thereby compatible with Raspberry Pi (all versions).

`Dockerfile.amd64-debian` is — you guessed it! — based on `resin/amd64-debian`. I use it for testing.

File an issue if you wish for another flavor.

The images include Shairport Sync from Debian testing (which as of 2017-11-19 is version 3.0.2).

## Usage with Raspberry Pi and Resin.io

1. Register a Resin.io app.
2. Boot your Raspberry Pi with a SD card flashed with the "firmware" for that app.
3. Clone/fork this repository and add your customizations.
4. Push the code to the repository Resin.io has created for your app.
5. *Boom!* Shairport Sync will now be deployed to your device.
