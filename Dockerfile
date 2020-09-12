FROM jenkins/agent:4.3-7-alpine

USER root

RUN apk update
RUN apk add make python3 bash py3-pip
RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python3-dev
RUN pip3 install azure-cli
RUN apk del --purge build

USER jenkins
