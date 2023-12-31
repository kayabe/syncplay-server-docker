# Syncplay Server - Docker

A docker image for running a [Syncplay](https://syncplay.pl/) server. Pulls the most up-to-date Syncplay build.

[![syncplay](https://raw.githubusercontent.com/Syncplay/syncplay/master/syncplay/resources/hicolor/128x128/apps/syncplay.png)](https://syncplay.pl/)

## Features
* [TLS Support](https://github.com/Syncplay/syncplay/wiki/TLS-support)
* MOTD File Support (allows useage of ASCII art in the server MOTD, among other benefits)
* Supports (almost) all Syncplay server args

## Useage

```
docker run -d \
  -p 8999:8999 \
  -e SALT=E1F53135E559C253 \
  -e PORT=8999 \
  -e PASSWORD=CHANGEME \
  -e ISOLATE=FALSE \
  -e DISABLEREADY=FALSE \
  -e DISABLECHAT=FALSE \
  -e MAXCHATLENGTH=120 \
  -e MAXUNAMELENGTH=20 \
  -e MOTD=TRUE \
  -e TLS=TRUE \
  -v ./syncplay-config:/config
kayabe/syncplay-server
```

## [Docker Compose](https://github.com/kayabe/syncplay-server/blob/main/docker-compose.yml) (Recommended)

```
version: "3"
services:
  syncplay:
    image: kayabe/syncplay-server:latest
    restart: always
    ports:
      - 8999:8999
    environment:
      - SALT=E1F53135E559C253
      - PORT=8999
      - PASSWORD=CHANGEME
      - ISOLATE=FALSE
      - DISABLEREADY=FALSE
      - DISABLECHAT=FALSE
      - MAXCHATLENGTH=120
      - MAXUNAMELENGTH=20
      - MOTD=TRUE
      - TLS=TRUE
    volumes:
      - ./syncplay-config:/config
 ```
 
 ## Parameters
 
 See the [Syncplay server guide](https://syncplay.pl/guide/server/) for more detailed explanations of these parameters.
 
| Parameter | Function |
| :----: | --- |
| `-p 8999` | Change this as well as -e PORT for a nonstandard port mapping |
| `-e SALT=<salt string>` | Optional, remove for no salt |
| `-e PORT=8999` | Default is 8999, change along with -p for nonstandard port mapping |
| `-e PASSWORD=<password string>` | Optional, remove to disable server password |
| `-e ISOLATE=FALSE` | Set to TRUE for *room isolation* |
| `-e DISABLEREADY=FALSE` | Set to TRUE to disable the readiness indicator feature |
| `-e DISABLECHAT=FALSE` | Set to TRUE to disable chat |
| `-e MAXCHATLENGTH=<x>` | Optional, remove to disable chat char. limit |
| `-e MAXUNAMELENGTH=<x>` | Optional, remove to disable username char. limit |
| `-e MOTD=FALSE` | Optional, set to TRUE to use an MOTD file |
| `-e TLS=FALSE` | Optional, set to TRUE to use [TLS CERTS](https://github.com/Syncplay/syncplay/wiki/TLS-support) |
| `-v ./syncplay-config:/config` | Specify path to config dir, certs folder and motd.txt will be placed here (visit [letsencrypt](https://letsencrypt.org/) for certs) |