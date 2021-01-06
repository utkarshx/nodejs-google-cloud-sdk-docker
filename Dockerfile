FROM node:12-slim
RUN apt-get update && apt-get install -yqq jq python3 unzip curl git
RUN npm install -g @angular/cli
RUN npm install -g firebase-tools --allow-root

RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

# Installing the package
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh -q --usage-reporting=false --additional-components beta

# Adding the package path to local
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin
