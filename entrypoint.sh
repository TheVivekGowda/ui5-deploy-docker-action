#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo ::set-output name=time::$time

mbt build --mtar -p=neo -t ui5app.mtar
