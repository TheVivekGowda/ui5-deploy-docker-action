# Container image that runs your code
FROM node:12.14.1-alpine

FROM devxci/mbtci-alpine:latest

RUN npm install mbt

RUN mbt build --mtar -p=neo -t ui5app.mtar
