# Container image that runs your code
FROM devxci/mbtci

# Create app directory
RUN mkdir -p /project
WORKDIR /project
COPY . .

RUN mbt build --mtar -p=neo
