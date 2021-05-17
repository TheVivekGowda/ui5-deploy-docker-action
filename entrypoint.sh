#!/bin/sh -l

docker run -u root -v "$(pwd):/project" mbt build --mtar -p=neo -t ui5app.mtar
