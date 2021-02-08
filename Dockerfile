FROM alpine:latest

LABEL maintainer="Autotoolr <https://gitlab.com/autotoolr-docker>" cli_version="1.17.2"

RUN apk -v --update add ca-certificates && \
    apk add --virtual=build curl tar zip gzip && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.2/bin/linux/amd64/kubectl && \

    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl && \
    apk --purge del build && \
    rm /var/cache/apk/*
