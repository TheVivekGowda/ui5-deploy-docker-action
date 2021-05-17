#!/bin/sh -l

docker pull devxci/mbtci

mbt build --mtar -p=neo -t ui5app.mtar
