# Install az CLI using PIP
FROM jenkins/inbound-agent:alpine
USER root

RUN apk add --no-cache bash
# Add Azure CLI
RUN apk update && apk upgrade && apk add  && \
    # REQUIREMENTS: Install bash, curl & azure-cli
    # Source: https://stackoverflow.com/questions/47699304/how-to-create-a-dind-docker-image-with-azure-cli-on-alpine-linux
     apk add bash make py-pip && \
     apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python2-dev && \
     pip install azure-cli && \
     apk del --purge build && \
     az -h
  
#Install K8s
RUN curl -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

USER jenkins
