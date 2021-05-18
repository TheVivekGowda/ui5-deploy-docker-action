#!/bin/sh -l

# mbt build --mtar -p=neo -t ui5app.mtar

docker run -u root -v "$(pwd):/project" devxci/mbtci:latest mbt build --mtar -p=neo -t ui5app.mtar
