FROM ubuntu:18.04

RUN apt-get install docker

RUN docker pull ppiper/neo-cli
RUN docker build -t ppiper/neo-cli .

# Container image that runs your code
FROM devxci/mbtci

USER root

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Make file executable
RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
