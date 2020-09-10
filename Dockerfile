FROM jenkins/inbound-agent:latest

USER root

##Installation of Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

RUN apt-get -q clean -y && \
                        rm -rf /var/lib/apt/lists/* && \
                        rm -f /var/cache/apt/*.bin

#Install K8s
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl


USER jenkins
