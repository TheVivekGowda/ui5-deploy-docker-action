#!/bin/sh -l

sudo ls -la /var/run/docker.sock

docker pull devxci/mbtci

docker build -t devxci/mbtci .

mbt build --mtar -p=neo -t ui5app.mtar
