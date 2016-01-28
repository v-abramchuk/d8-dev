#!/bin/bash
set -e

cat /usr/local/share/logo.txt

if [ -f /tmp/dummyfile ]; then
	echo Mapping UIDs...
	OLDUID=`id -u www-data`
	NEWUID=`stat -c '%u' /tmp/dummyfile`
	usermod -u $NEWUID www-data
	find /var/www -user $OLDUID -exec chown -h $NEWUID {} \;
fi

chown -R www-data:www-data /var/www/html
if [ -z "$(ls -A "/var/www/html")" ]; then
	echo "Oh so you don't have a Drupal. No worries, we'll make one for you."
	gosu www-data /download_drupal.sh
fi

exec "$@"

