#!/usr/bin/env bash
set -e

if [ ! -n "$1" ]
then
	echo "1st argument missing"
	exit 1
fi

WEB_PORT=$1

sed -i "s/url\: http\:\/\/127.0.0.1:.*/url\: http\:\/\/127.0.0.1:${WEB_PORT##*/}/" conf/traefik/dynamic/http.yml

echo "SUCCESS"
