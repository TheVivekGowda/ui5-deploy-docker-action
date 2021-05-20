FROM openjdk:11-jdk-slim

# Download required env tools
RUN apt-get update && \
    apt-get install --yes --no-install-recommends curl git nodejs && \

    wget https://github.com/SAP/cloud-mta-build-tool/releases/download/v${MBT_VERSION}/cloud-mta-build-tool_${MBT_VERSION}_Linux_amd64.tar.gz
    
    tar xvzf cloud-mta-build-tool_LATEST_Linux_amd64.tar.gz
    
    cp mbt /usr/local/bin/

USER root

RUN  apt-get install bash && \
     mvn com.sap.cloud:neo-javaee7-wp-maven-plugin:1.89.11:install-sdk -DsdkInstallPath=sdk -Dincludes=tools/**,license/**,sdk.version && \
     chmod -R 777 sdk && \
     ln -s /sdk/tools/neo.sh /usr/bin/neo.sh && \
     rm -rf /var/lib/apt/lists/*

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Make file executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
