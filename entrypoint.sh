#!/bin/sh -l

# build mtar file
mbt build --mtar -p=neo -t ui5app.mtar

# deploy mtar file to cloud
neo.sh deploy-mta --host $1 --account $2 --source ./ui5app.mtar --synchronous --user $3 --password $4

npm install -g ui5-nwabap-deployer-cli

ui5-deployer --help
