# Container image that runs your code
FROM devxci/mbtci

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . .

RUN mbt build --mtar -p=neo
