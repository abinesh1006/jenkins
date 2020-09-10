## This is base image
FROM jenkins/inbound-agent:latest

USER root

##Installation of Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

RUN apt-get -q clean -y && rm -rf /var/lib/apt/lists/* && rm -f /var/cache/apt/*.bin

#Install K8s 
RUN curl -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
     && chmod +x /usr/local/bin/kubectl

USER jenkins
