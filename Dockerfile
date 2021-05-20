FROM alpine:latest

RUN apk add wget && apk add tar && apk add bash

# Download required env tools
RUN wget https://github.com/SAP/cloud-mta-build-tool/releases/download/v1.1.1/cloud-mta-build-tool_1.1.1_Linux_amd64.tar.gz
    
    tar xvzf cloud-mta-build-tool_1.1.1_Linux_amd64.tar.gz
    
    cp mbt /usr/local/bin/

USER root

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Make file executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
