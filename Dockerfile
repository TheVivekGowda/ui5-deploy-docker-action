# Container image that runs your code
FROM node:lts-alpine

RUN npm i -g --force yarn

FROM devxci/mbtci-alpine:latest
