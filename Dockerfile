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

RUN neo.sh deploy-mta --host eu2.hana.ondemand.com --account jrqll30d0f --source /project/ui5app.mtar --synchronous --user S0021327149 --password jgmpp712GWSk
