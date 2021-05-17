#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo ::set-output name=time::$time

docker run -u root -v "$(pwd):/project" devxci/mbtci:latest mbt build --mtar -p=neo -t ui5app.mtar