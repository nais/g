FROM google/cloud-sdk:alpine

WORKDIR /root
RUN gcloud components install kubectl

CMD bash
