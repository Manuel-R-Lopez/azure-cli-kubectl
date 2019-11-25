FROM microsoft/azure-cli

# These should be changed as required to stay in sync with your target kubernetes environment
ENV KUBERNETES_VERSION=1.14.7
ENV HELM_VERSION=2.16.1

RUN wget https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl -qO /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

RUN wget https://storage.googleapis.com/kubernetes-helm/helm-v${HELM_VERSION}-linux-amd64.tar.gz -qO helm.tgz
RUN tar -zxvf helm.tgz
RUN cp linux-amd64/helm /usr/local/bin/helm
RUN chmod +x /usr/local/bin/helm
