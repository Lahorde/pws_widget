# PWS Widget
## Description
A [conky](https://github.com/brndnmtthws/conky) widget displaying some weather, pollution and other data from selected place city, home :
* your / a live weather report from a selected Personal Weather Station- all Personal Weather Station are shown on [Weather Underground Wundermap](https://www.wunderground.com/wundermap) 
* weather forecast - got from [Weather Underground](https://www.wunderground.com/)
* wind live report from some PiouPiou - all anemometer are shown on [PiouPiou map](https://pioupiou.com/fr/map) with its data retrieved using [PiouPiou API](http://developers.pioupiou.fr/api/live/)
* pollution data from professional pollution station from [ATMO Auvergne Rhone Alpes](https://www.atmo-auvergnerhonealpes.fr/). All stations are [here](https://www.atmo-auvergnerhonealpes.fr/donnees/acces-par-station)
* ATMO pollution forecast using [ATMO API](https://www.atmo-auvergnerhonealpes.fr/donnees-ouvertes-de-qualite-de-lair)
* some home related info stored in an influxdb time series

## how it works
* A systemd service called `pws_client` gathered all widget needed data. It runs `./fetch_widget_data.py` script. It writes these data to a file read by Conky
* A conky widget that reads and displays gathered gathered data read by `pws_client` 

## how it looks

Here is result in xfce :

![alt text](https://github.com/Lahorde/pws_widget/raw/master/snapshot/pws_conky.jpg)

## Configuration
Set needed parameters (token, city...) in : 

    ./pws_widget_params.sh
    
Enable pws_service :

    # if / and project are in same partition
    sudo ln -s ./pws_client.service /etc/systemd/system
    # otherwise
    sudo cp ./pws_client.service /etc/systemd/system
    sudo systemctl enable pws_client
    sudo systemctl start pws_client
    
To get pws logs :

    journalctl -u pws_client -f
    
Start user pws widget (either using systemd user units, or using automatic application startup):

    bash -c "./start_conky.sh"

You can stop / start `pws_client` on network connection disconnection using `52-start-pws_client`

## References

  * [Conky & PWS](http://letchap.github.io/2013/07/08/afficher-la-meteo-avec-conky-et-python-1ere-partie/)
  * [ Wunderground Icon glossary](http://www.wunderground.com/weather/api/d/docs?d=resources/phrase-glossary)
  * [PiouPiou github repo](https://github.com/bacpluszero/pioupiou-v0)
