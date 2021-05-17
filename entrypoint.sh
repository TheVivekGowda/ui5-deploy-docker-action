#!/bin/sh -l

docker pull devxci/mbtci

yarn add mbt

mbt build --mtar -p=neo -t ui5app.mtar
