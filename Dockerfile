# Container image that runs your code
FROM devxci/mbtci

# Create app directory
RUN root -v "$(pwd):/project"

RUN mbt build --mtar -p=neo
