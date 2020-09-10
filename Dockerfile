# Install az CLI using PIP
FROM jenkins/inbound-agent:alpine
USER root
ENV AZ 2.0.64
RUN apk add -U python3 bash ca-certificates && \
    apk add --virtual=build gcc python3-dev musl-dev libffi-dev openssl-dev make  && \
    pip3 install --upgrade requests && \
    pip3 install azure-cli==${AZ} && \
    ln -s /usr/bin/python3 /usr/bin/python  
#Install K8s
RUN curl -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

USER jenkins
