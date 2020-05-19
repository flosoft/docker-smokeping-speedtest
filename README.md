# docker-smokeping-speedtest

[![Docker Build Status](https://img.shields.io/docker/cloud/build/florider89/smokeping-speedtest.svg)](https://hub.docker.com/r/florider89/smokeping-speedtest/)
[![Docker Pulls](https://img.shields.io/docker/pulls/florider89/smokeping-speedtest.svg)](https://hub.docker.com/r/florider89/smokeping-speedtest/)
[![Docker Automated build](https://img.shields.io/docker/cloud/automated/florider89/smokeping-speedtest.svg)](https://hub.docker.com/r/florider89/smokeping-speedtest/)

Smokeping docker image with [smokeping-speedtest](https://github.com/mad-ady/smokeping-speedtest) probe and [speedtest-cli](https://github.com/sivel/speedtest-cli), built upon linuxserver's [docker-smokeping](https://github.com/linuxserver/docker-smokeping) image.
It also includes Ookla's official Speedtest CLI.

## docker repository

[florider89/smokeping-speedtest](https://hub.docker.com/r/florider89/smokeping-speedtest)

## usage

```bash
docker run \
  -d \
  --name=smokeping-speedtest \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -p 80:80 \
  -v /path/to/smokeping/config:/config \
  -v /path/to/smokeping/data:/data \
  --restart unless-stopped \
  florider89/smokeping-speedtest
```

Add speedtest configuration to Probes and Targets config files as per the instructions at https://github.com/mad-ady/smokeping-speedtest.
As this image contains both the original speedtest and Ookla's speedtest-cli, you can set up one or the other. The probes are simply called `speedtest` and `speedtestcli`

To use Ookla's speedtest, use the following configuration

### Probes
```+ speedtestcli
binary = /usr/local/bin/ookla-speedtest
timeout = 300
step = 3600
#offset = random
pings = 3
forks = 1

++ speedtestcli-download
measurement = download
offset = 25%

++ speedtestcli-upload
measurement = upload
offset = 75%
```

### Targets
```++ download_fr_gravelines_ovh
menu = Download OVH Gravelines
title = Download from OVH Cloud (Gravelines, France) [1050.10 km]
probe = speedtestcli-download
server = 25985
measurement = download
host = dummy.com

++ upload_fr_gravelines_ovh
menu = Upload OVH Gravelines
title = Upload from OVH Cloud (Gravelines, France) [1050.10 km]
probe = speedtestcli-upload
server = 25985
measurement = upload
host = dummy.com
```


## Credits

This docker image just pieces the bits together. The real work is all done by:
  - [mad-ady](https://github.com/mad-ady)'s [smokeping-speedtest](https://github.com/mad-ady/smokeping-speedtest)
  - [sivel](https://github.com/sivel)'s [speedtest-cli](https://github.com/sivel/speedtest-cli)
  - [linuxserver](https://github.com/linuxserver)'s [docker-smokeping](https://github.com/linuxserver/docker-smokeping)
