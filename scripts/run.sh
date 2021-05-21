#!/bin/bash

ISTIO_VERSION="${4}"

curl -L https://istio.io/downloadIstio | ISTIO_VERSION=${ISTIO_VERSION} TARGET_ARCH=x86_64 sh -

cd istio-${ISTIO_VERSION}

export PATH=${PATH}:$PWD/bin

ibmcloud plugin install -f kubernetes-service
sleep 2
ibmcloud login --apikey "${1}" -r "us-south"
sleep 2
ibmcloud ks cluster config --cluster $2
sleep 30
istioctl install --set profile=demo -y
sleep 2
kubectl label namespace $3 istio-injection=enabled
sleep 2
kubectl apply -f "./samples/bookinfo/platform/kube/bookinfo.yaml"
