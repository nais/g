FROM google/cloud-sdk:alpine

WORKDIR /root
<<<<<<< HEAD
RUN gcloud components install kubectl

=======

RUN apk update && apk add netcat-openbsd git go musl-dev docker
RUN go get github.com/jstemmer/go-junit-report	

RUN gcloud components install kubectl

>>>>>>> 406420c903d9973bd9ddbaa2883591dc1576dae8
CMD bash
