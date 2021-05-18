# Container image that runs your code
FROM devxci/mbtci

USER root

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Make file executable
RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["entrypoint.sh"]


# FROM ppiper/neo-cli

# USER root

# COPY --from=0 /project /project

# # Copies your code file from your action repository to the filesystem path `/` of the container
# COPY neo.sh /neo.sh

# # Make file executable
# RUN chmod +x /neo.sh

# ENTRYPOINT ["neo.sh"]
