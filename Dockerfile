ARG GO_VERSION=1.19.2
ARG KUBECONFORM_VERSION=v0.4.14

FROM golang:$GO_VERSION-alpine AS builder

WORKDIR /usr/local/src/app/
COPY . .

RUN apk add --update make
RUN make build

FROM ghcr.io/yannh/kubeconform:$KUBECONFORM_VERSION-alpine AS kubeconform

# no need to parametrize the version of Alpine Linux as it’s only used
# for curl & unzip
FROM alpine:3.16 AS downloader

ARG HELM_VERSION=v3.9.4

RUN apk add -q --no-cache curl

# https://get.helm.sh/helm-v3.7.0-linux-amd64.tar.gz
RUN mkdir /helm && cd /helm && curl -sSL https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar xzf -

FROM gcr.io/distroless/static@sha256:912bd2c2b9704ead25ba91b631e3849d940f9d533f0c15cf4fc625099ad145b1

COPY --from=builder /usr/local/src/app/helm-kubeconform-action /helm-kubeconform-action

COPY --from=kubeconform /kubeconform /kubeconform

COPY --from=downloader /helm/linux-amd64/helm /helm

ENV KUBECONFORM=/kubeconform

ENV HELM=/helm

ENTRYPOINT ["/helm-kubeconform-action"]
