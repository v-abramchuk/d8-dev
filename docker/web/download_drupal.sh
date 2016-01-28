#!/bin/bash

export DRUPAL_VERSION=8.0.2
export DRUPAL_MD5=9c39dec82c6d1a6d2004c30b11fb052e

curl -fSL "http://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz" -o /tmp/drupal.tar.gz
echo "${DRUPAL_MD5} /tmp/drupal.tar.gz" | md5sum -c -
tar -xz --strip-components=1 -f /tmp/drupal.tar.gz
rm /tmp/drupal.tar.gz

cd /var/www/html

echo Checking MySQL connectivity.
i=0
while ! mysqladmin ping -h mysql -u drupal -ppassword --silent; do
    if [ $i -ge 60 ]; then
        echo "MySQL waiting timeout."
        exit 1
    fi
    ((i=i+1))
    sleep 1
done

echo Installing Drupal.
drush site-install standard --db-url='mysql://drupal:password@mysql/drupal' --site-name=D8-Dev -y --account-pass=password --writable

