# CI / CD tools

Is a Docker image with docker, helm 3.6.0 and kubectl 1.21.1

It can be used for ci jobs in GitLab.

## Usage

```
stages:
  - deploy

deploy:
  stage: deploy
  environment:
    name: dev
    kubernetes:
      namespace: default
  image: chrishoerl/citools:latest
  script:
  - kubectl apply -f deployment.yml
```
