#!/bin/bash

BASEDIR=$(dirname "$0")
$BASEDIR/prepare-thingsboard.sh

if [[ -z $WITH_EMBEDDED_POSTGRES ]]; then
	DOCKER_FILE_NAME=docker-compose
else
	DOCKER_FILE_NAME=docker-compose-postgres
fi 

if [[ $ENV_TYPE == "local" ]]; then
	docker-compose -f $DOCKER_FILE_NAME.local.yml up -d
	exit 0
fi

#Check enviroment variables required
if [[ -z $DOMAIN_BASE ]]; then
	echo "Using default DOMAIN_BASE"
	DOMAIN_BASE=localhost
fi

if [[ -z $DOMAIN_EMAIL ]]; then
	echo "Using default DOMAIN_EMAIL"
	DOMAIN_EMAIL=mail@example.com
fi

#Check if .env file exists and delete previous generated 
if [[ -f ".env" ]]; then
	sed -i '/DOMAIN_BASE=/d' .env
	sed -i '/DOMAIN_EMAIL=/d' .env
fi

echo "DOMAIN_BASE=${DOMAIN_BASE}" >> .env
echo "DOMAIN_EMAIL=${DOMAIN_EMAIL}" >> .env

docker-compose -f $DOCKER_FILE_NAME.yml up -d
