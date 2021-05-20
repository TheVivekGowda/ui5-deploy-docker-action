FROM alpine:latest

RUN apk add wget && apk add tar && apk add bash && apk add make && apk add maven

# Download required env tools
RUN wget https://github.com/SAP/cloud-mta-build-tool/releases/download/v1.1.1/cloud-mta-build-tool_1.1.1_Linux_amd64.tar.gz
    
RUN tar xvzf cloud-mta-build-tool_1.1.1_Linux_amd64.tar.gz
    
RUN cp mbt /usr/local/bin/

RUN mvn com.sap.cloud:neo-javaee7-wp-maven-plugin:1.89.11:install-sdk -DsdkInstallPath=sdk -Dincludes=tools/**,license/**,sdk.version

RUN chmod -R 777 sdk

RUN ln -s /sdk/tools/neo.sh /usr/bin/neo.sh

USER root

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Make file executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
