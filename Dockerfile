FROM docker:stable

# Install git (used for installing helm push plugin)
RUN apk update && apk upgrade \
  && apk add --no-cache bash git openssh gawk

# Install helm
RUN mkdir /tmp/helm && cd /tmp/helm \
  && wget --no-check-certificate https://get.helm.sh/helm-v3.5.2-linux-amd64.tar.gz \
  && tar xvf helm-v3.0.2-linux-amd64.tar.gz \
  && cp linux-amd64/helm /usr/bin/helm \
  && cd / && rm -rf /tmp/helm \
  && helm plugin install https://github.com/chartmuseum/helm-push
#  && helm repo add --username='robot$gitlab' --password='xxxxx' gitlab.example.com http://gitlab.example.com:4000

# Install kubectl
RUN mkdir /tmp/kubectl && cd /tmp/kubectl \
  && wget --no-check-certificate https://storage.googleapis.com/kubernetes-release/release/v1.20.2/bin/linux/amd64/kubectl \
  && chmod +x ./kubectl \
  && cp ./kubectl /usr/bin/kubectl \
  && cd / && rm -rf /tmp/kubectl

##alternative
#FROM gcr.io/google.com/cloudsdktool/cloud-sdk:alpine
#RUN gcloud components install kubectl