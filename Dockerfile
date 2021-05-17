# Container image that runs your code
FROM devxci/mbtci

# Create app directory
RUN mkdir project

RUN mbt build --mtar -p=neo
