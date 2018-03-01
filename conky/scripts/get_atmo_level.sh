#! /bin/sh

atmo_level=$(grep '^poll_level =' /tmp/wu_polling.data | awk -F " " '{$1=$2=""; print $0}')
if [ -z $atmo_level ]
then
  exit 1
fi

# Levels defined here : http://www.atmo-france.org/fr/index.php?/2008043044/indice-de-qualite-d-air/id-menu-275.html
# but I took it from here : https://www.atmo-auvergnerhonealpes.fr/monair/commune/38185c
echo -n "\${image $PWS_CLIENT_PROJECT_PATH/icons/atmo_$((${atmo_level%.*}/10+1)).png -p $1,$2 -s $3x$3}"
exit 0
