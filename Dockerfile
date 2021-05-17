# Container image that runs your code
FROM alpine:3.10

FROM devxci/mbtci-alpine:latest

RUN yarn add mbt

RUN mbt build --mtar -p=neo -t ui5app.mtar
