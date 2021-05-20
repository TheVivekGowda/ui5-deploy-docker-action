#!/bin/sh -l

# build mtar file
mbt build --mtar -p=neo -t ui5app.mtar

# deploy mtar file to cloud
neo.sh deploy-mta --host $1 --account $2 --source ./ui5app.mtar --synchronous --user $3 --password $4

# deploy as bsp application
# ui5-deployer deploy --server https://integrtrdev.integrtr.com:8443/ --client '100' --user VG --pwd coffeegood --package ZUI5_DEPLOY --bspContainer ZUI5BP --bspContainerText 'Boilerplate' --transportNo INDK901302 --transportText 'UI5' --calculateApplicationIndex true