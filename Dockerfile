FROM alpine:latest

RUN apk --no-cache add docker

RUN docker pull devxci/mbtci

RUN docker build -t devxci/mbtci .

# Container image that runs your code
# FROM devxci/mbtci

USER root

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Make file executable
RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
