FROM java:8
FROM microsoft/azure-cli

LABEL authors="Trueconnect"

RUN wget -c https://storage.googleapis.com/golang/go1.8.7.linux-arm64.tar.gz -qO golang.tgz
RUN ls -l
RUN tar -C /usr/local -xzf golang.tgz;
ENV PATH=$PATH:/usr/local/go/bin
ENV GOROOT=/usr/local/go

ENV KUBERNETES_VERSION=1.10.12
RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.10.12/bin/linux/amd64/kubectl -qO /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

RUN wget https://storage.googleapis.com/kubernetes-helm/helm-v2.12.1-linux-amd64.tar.gz -qO helm.tgz
RUN tar -zxvf helm.tgz
RUN cp linux-amd64/helm /usr/local/bin/helm
RUN chmod +x /usr/local/bin/helm

# preserve Java 8  from the maven install.
RUN mv /etc/alternatives/java /etc/alternatives/java8
