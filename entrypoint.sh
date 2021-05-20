#!/bin/sh -l

if [ $1 == 'neo' ]
then
    # build mtar file
    mbt build --mtar -p=neo -t ui5app.mtar
    # deploy mtar file to cloud
    neo.sh deploy-mta --host $3 --account $4 --source ./ui5app.mtar --synchronous --user $1 --password $2
elif [ $1 == 'bsp' ]
then
    # deploy app as BSP
    ui5-deployer deploy --server $3 --user $1 --pwd $2
else
   echo "Please provide valid deployment type. Allowed values are neo and bsp"
fi