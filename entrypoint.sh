#!/bin/sh -l

apt-get update; apt-get install curl

curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
  
docker pull devxci/mbtci

mbt build --mtar -p=neo -t ui5app.mtar

neo.sh deploy-mta --host eu2.hana.ondemand.com --account jrqll30d0f --source /project/ui5app.mtar --synchronous --user S0021327149 --password jgmpp712GWSk
