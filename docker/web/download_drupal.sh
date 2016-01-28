#!/bin/bash

export DRUPAL_VERSION=8.0.2
export DRUPAL_MD5=9c39dec82c6d1a6d2004c30b11fb052e

curl -fSL "http://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz" -o /tmp/drupal.tar.gz \
	&& echo "${DRUPAL_MD5} /tmp/drupal.tar.gz" | md5sum -c - \
	&& tar -xz --strip-components=1 -f /tmp/drupal.tar.gz \
	&& rm /tmp/drupal.tar.gz \
	&& chown -R www-data:www-data sites

