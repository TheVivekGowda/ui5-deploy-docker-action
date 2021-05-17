# Container image that runs your code
FROM alpine:3.10

FROM devxci/mbtci-alpine:latest

RUN apt-get update -qq && apt-get install -y yarn

RUN yarn add mbt

RUN mbt build --mtar -p=neo -t ui5app.mtar
