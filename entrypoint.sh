#!/bin/sh

sed -i 's/YOUR_OSU_API_KEY_HERE/'"$OSUKEY"'/g' config.ini
sed -i 's/MYSQL_ROOT_PASSWORD/'"$MYSQL_ROOT_PASSWORD"'/g' config.ini

exec "$@"
