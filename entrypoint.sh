#!/bin/sh -l

# mbt build --mtar -p=neo -t ui5app.mtar

ls -R

docker run -u root -v /project devxci/mbtci:latest mbt build --mtar -p=neo -t ui5app.mtar
