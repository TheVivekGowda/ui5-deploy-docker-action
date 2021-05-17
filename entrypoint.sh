#!/bin/sh -l

docker pull devxci/mbtci

npm install -g mbt

mbt build --mtar -p=neo -t ui5app.mtar
