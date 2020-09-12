FROM jenkins/agent:alpine

USER root
RUN apk update
RUN pip install azure-cli
RUN apk del --purge build
#Install K8s
USER jenkins
