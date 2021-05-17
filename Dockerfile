# Container image that runs your code
FROM devxci/mbtci

RUN mbt build --mtar -p=neo
