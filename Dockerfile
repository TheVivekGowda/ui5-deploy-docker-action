# Container image that runs your code
FROM node:12.14.1-alpine

FROM devxci/mbtci

RUN mbt build -s '/'
