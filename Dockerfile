# Container image that runs your code
FROM devxci/mbtci

USER root

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Make file executable
RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

FROM ppiper/neo-cli

# COPY --from=0 /project ./project

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY deploy.sh /deploy.sh

# Make file executable
RUN chmod +x /deploy.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/deploy.sh"]
