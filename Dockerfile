FROM jenkins/agent:4.3-7-alpine

USER root

RUN apk update && \
    apk add make python3 bash py3-pip && \
    apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev && \
    pip3 install azure-cli && \
    apk del --purge build && rm -rf /var/cache/apk/*

USER jenkins
