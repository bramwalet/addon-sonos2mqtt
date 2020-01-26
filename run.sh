#!/bin/bash
#set -e

CONFIG_PATH=/data/options.json
#SYSTEM_USER=/data/system_user.json

# set environment variables from hass.io options
export SONOS_LISTENER_HOST="$(jq --raw-output '.listener_host' $CONFIG_PATH)"
export SONOS2MQTT_DEVICE="$(jq --raw-output '.device' $CONFIG_PATH)"
export SONOS2MQTT_MQTT="$(jq --raw-output '.mqtt' $CONFIG_PATH)"

node index.js -v debug
