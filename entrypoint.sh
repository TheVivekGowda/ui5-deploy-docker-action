#!/bin/sh -l

docker run -u root -v "$(pwd):/project" devxci/mbtci:latest mbt build --mtar -p=neo -t ui5app.mtar
