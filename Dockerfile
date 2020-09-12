FROM jenkins/agent:alpine

USER root
RUN apk update
RUN apk add bash py-pip
RUN apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python- dev
RUN pip install azure-cli
RUN apk del --purge build
#Install K8s
USER jenkins
