FROM golang:1.8
FROM microsoft/azure-cli

LABEL authors="Trueconnect"

ENV KUBERNETES_VERSION=1.10.12
RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.10.12/bin/linux/amd64/kubectl -qO /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kubectl

RUN wget https://storage.googleapis.com/kubernetes-helm/helm-v2.12.1-linux-amd64.tar.gz -qO helm.tgz
RUN tar -zxvf helm.tgz
RUN cp linux-amd64/helm /usr/local/bin/helm
RUN chmod +x /usr/local/bin/helm

FROM java:8

# preserve Java 8  from the maven install.
RUN mv /etc/alternatives/java /etc/alternatives/java8
RUN apt-get update -y && apt-get install maven -y

# Restore Java 8
RUN mv -f /etc/alternatives/java8 /etc/alternatives/java
RUN ls -l /usr/bin/java && java -version
