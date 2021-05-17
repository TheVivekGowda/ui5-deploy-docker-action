# Container image that runs your code
FROM node:14

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Make file executable
RUN chmod +x /entrypoint.sh

FROM devxci/mbtci:latest

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

CMD ["mbt"]
