# Container image that runs your code
FROM alpine:3.7

# USER root

RUN sudo dockerd

RUN apk add --no-cache docker

RUN docker pull devxci/mbtci

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Make file executable
RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

CMD ["docker", "mbt"]
