# Container image that runs your code
FROM devxci/mbtci:latest
FROM ppiper/neo-cli:latest

USER root

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Make file executable
RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
