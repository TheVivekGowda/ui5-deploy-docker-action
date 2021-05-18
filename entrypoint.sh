#!/bin/sh -l

# mbt build --mtar -p=neo -t ui5app.mtar

ls -R

docker -u root -v . devxci/mbtci:latest mbt build --mtar -p=neo -t ui5app.mtar
