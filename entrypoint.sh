#!/bin/sh -l

docker pull devxci/mbtci

npm install mbt

mbt build --mtar -p=neo -t ui5app.mtar
