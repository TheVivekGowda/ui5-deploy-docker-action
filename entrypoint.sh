#!/bin/sh -l

docker pull devxci/mbtci-alpine:latest

mbt build --mtar -p=neo
