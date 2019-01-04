FROM microsoft/azure-cli

LABEL authors="Trueconnect"

ENV KUBERNETES_VERSION=1.10.12
RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.10.12/bin/linux/amd64/kubectl -qO /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl