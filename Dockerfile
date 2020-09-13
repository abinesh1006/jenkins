FROM jenkins/inbound-agent:4.3-8-alpine

USER root

RUN apk update && \
   apk add --no-cache --update  bash python3 py3-pip  && \
   apk add --no-cache --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev make curl && \
   pip3 --no-cache-dir install azure-cli  && \
   curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl  \
    &&  mv ./kubectl /usr/local/bin/kubectl && \
    apk del --purge build && rm -rf /var/cache/apk/*
