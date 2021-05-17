# Container image that runs your code
FROM node:lts-alpine

RUN apk add --no-cache git python2 build-base
RUN npm i -g --force yarn

FROM devxci/mbtci-alpine:latest

RUN yarn add mbt

RUN mbt build --mtar -p=neo -t ui5app.mtar
