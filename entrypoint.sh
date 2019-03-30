#!/bin/sh

sed -i 's/YOUR_OSU_API_KEY_HERE/'"$OSUKEY"'/g' config.ini
exec "$@"
