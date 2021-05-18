#!/bin/sh -l

# mbt build --mtar -p=neo -t ui5app.mtar

ls -R

docker exec -it //bin//sh -u root -v . devxci/mbtci:latest mbt build --mtar -p=neo -t ui5app.mtar
