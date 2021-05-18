#!/bin/sh -l

mbt build --mtar -p=neo -t ui5app.mtar

ls -R

neo.sh deploy-mta --host eu2.hana.ondemand.com --account jrqll30d0f --source ./ui5app.mtar --synchronous --user S0021327149 --password jgmpp712GWSk
