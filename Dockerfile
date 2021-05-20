# base image for docker container
FROM alpine:latest

# Notes
# -q is for --quiet installation in apk, wget and mvn

# install dependent alpine packages
RUN apk add -q wget && apk add -q tar && apk add -q bash && apk add -q make && apk add -q maven && apk add -q npm

# Installing SAP cloud mta build tool for creating MTAR files for SAP cloud deployment

# download SAP cloud mta build tool
RUN wget --quiet https://github.com/SAP/cloud-mta-build-tool/releases/download/v1.1.1/cloud-mta-build-tool_1.1.1_Linux_amd64.tar.gz

# extract SAP cloud mta build tool content
RUN tar xvzf cloud-mta-build-tool_1.1.1_Linux_amd64.tar.gz

# copy mbt binary file to ~/bin
RUN cp mbt /usr/local/bin/

# Installing SAP BTP Neo SDK for using Neo CLI which helps in Neo Deployment

# download SAP BTP Neo SDK / installs neo shell
RUN mvn --quiet com.sap.cloud:neo-javaee7-wp-maven-plugin:1.89.11:install-sdk -DsdkInstallPath=sdk -Dincludes=tools/**,license/**,sdk.version

# update downloaded folder permissions
RUN chmod -R 777 sdk

# create symbolic link to neo shell
RUN ln -s /sdk/tools/neo.sh /usr/bin/neo.sh

# Instaling CLI tool from https://github.com/pfefferf/ui5-nwabap-deployer for enabling BSP deployment

# install nwabap cli as npm package, it is required to store it in /usr/local path to make use of npm package
RUN npm install --prefix /usr/local -g ui5-nwabap-deployer-cli

# copy your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# update downloaded folder permissions
RUN chmod +x /entrypoint.sh

# shell file to load once container invokes
ENTRYPOINT ["/entrypoint.sh"]
