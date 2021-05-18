#!/bin/sh -l

# mbt build --mtar -p=neo -t ui5app.mtar

ls -R

docker pull devxci/mbtci-alpine:latest
docker build -t devxci/mbtci .
