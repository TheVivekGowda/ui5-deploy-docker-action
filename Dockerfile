# base image for docker container
FROM alpine:latest

# install dependent alpine packages
RUN apk add -q wget && apk add -q tar && apk add -q bash && apk add -q make && apk add -q maven

# download SAP cloud mta build tool
RUN wget https://github.com/SAP/cloud-mta-build-tool/releases/download/v1.1.1/cloud-mta-build-tool_1.1.1_Linux_amd64.tar.gz

# extract SAP cloud mta build tool content
RUN tar xvzf cloud-mta-build-tool_1.1.1_Linux_amd64.tar.gz

# copy mbt binary file to ~/bin
RUN cp mbt /usr/local/bin/

# download SAP BTP Neo SDK / installs neo shell
RUN mvn com.sap.cloud:neo-javaee7-wp-maven-plugin:1.89.11:install-sdk -DsdkInstallPath=sdk -Dincludes=tools/**,license/**,sdk.version

# update downloaded folder permissions
RUN chmod -R 777 sdk

# create symbolic link to neo shell
RUN ln -s /sdk/tools/neo.sh /usr/bin/neo.sh

# copy your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# update downloaded folder permissions
RUN chmod +x /entrypoint.sh

# shell file to load once container invokes
ENTRYPOINT ["/entrypoint.sh"]
