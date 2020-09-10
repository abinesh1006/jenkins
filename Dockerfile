# Install az CLI using PIP
FROM jenkins/inbound-agent:alpine
USER root

RUN apk add --no-cache bash
# Add Azure CLI
RUN \
  apk update && \
  apk add bash py-pip && \
  apk add --virtual=build gcc libffi-dev musl-dev openssl-dev python-dev make && \
  pip install azure-cli && \
  apk del --purge build 
  
#Install K8s
RUN curl -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

USER jenkins
