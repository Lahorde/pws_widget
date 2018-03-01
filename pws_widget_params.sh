#!/bin/sh
echo reading pws client parameters

#Weather Underground PWS ID
export WU_PWS_ID=""

# Weather underground key
export WU_KEY=""

# Weather underground password
export WU_PWD=""

# Weather station server prefix
export VENT_PIOU_PIOU_URL_PREFIX=""

# WU stations for wind
export VENT_1_URL_SUFFIX=""

# Piou Piou stations for wind
export VENT_1_PIOU_PIOU_URL_SUFFIX=""
export VENT_2_PIOU_PIOU_URL_SUFFIX=""

# influxdb Key for home data
export INFLUX_DB_HOST_URL=""
export INFLUX_DB_HOST_PORT=""
export INFLUXDB_NAME=""
export INFLUX_DB_USER=""
export INFLUX_DB_PASS=""
export INFLUXDB_SERIES_SUFFIX=""
export INFLUXDB_HOME_TEMP_FIELD=""
export INFLUXDB_HOME_HUMIDITY_FIELD=""

# Rhone Alpes Air network
# Rhone Alpes station id: http://www.air-rhonealpes.fr/donnees/acces-par-station
export POLLUTION_STATION_ID=""

# ATMO provides an API to get open data about air quality
# we will use it to get current ATMO level https://fr.wikipedia.org/wiki/Indice_de_qualit%C3%A9_de_l%27air#Indice_Atmo
# in given location
export ATMO_API_TOKEN=""
export ATMO_POLLUTION_LEVEL_LOCATION=""

# where are polling data
export PWS_POLLING_DATA_PATH=""

