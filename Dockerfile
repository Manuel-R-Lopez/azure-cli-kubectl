FROM microsoft/azure-cli

LABEL authors="Trueconnect"

ENV KUBERNETES_VERSION=1.10.12
RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.10.12/bin/linux/amd64/kubectl -qO /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

RUN wget https://storage.googleapis.com/kubernetes-helm/helm-v2.12.1-linux-amd64.tar.gz
RUN tar -zxvf helm-v2.12.1-linux-amd64.tgz
RUN mv linux-amd64/helm /usr/local/bin/helm
RUN chmod +x /usr/local/bin/helm