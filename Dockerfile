FROM google/cloud-sdk:alpine

WORKDIR /root

RUN apk update && apk add netcat-openbsd git go musl-dev docker
RUN go get github.com/jstemmer/go-junit-report	

RUN gcloud components install kubectl

CMD bash
