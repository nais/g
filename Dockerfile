FROM google/cloud-sdk:alpine

RUN apk upgrade --update && \
    apk add bash curl

ENV HELM_VERSION="v2.8.1"
ENV YQ_VERSION="1.14.0"
ENV LANDSCAPER_VERSION="1.0.14"

WORKDIR /root

RUN gcloud components install kubectl

RUN curl -s https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz | \
    tar -xz -C /tmp && \
    mv /tmp/linux-amd64/helm /usr/bin

RUN curl -Ls https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 > /usr/bin/yq && \
    chmod +x /usr/bin/yq

RUN curl -Ls https://github.com/Eneco/landscaper/releases/download/v${LANDSCAPER_VERSION}/landscaper-${LANDSCAPER_VERSION}-linux-amd64.tar.gz | \
    tar xzf - -C /usr/bin landscaper && \
    chmod +x /usr/bin/landscaper

RUN curl -s https://raw.githubusercontent.com/nais/builder_images/master/naiscaper/naiscaper  > /usr/bin/naiscaper && \
    chmod +x /usr/bin/naiscaper

RUN curl -s https://raw.githubusercontent.com/nais/naisible/master/bin/cfssl > /usr/bin/cfssl && \
    curl -s https://raw.githubusercontent.com/nais/naisible/master/bin/cfssljson > /usr/bin/cfssljson && \
    chmod +x /usr/bin/cfssl*

# get version 0.6.0
RUN curl -L https://git.io/getLatestIstio | sh

CMD bash
