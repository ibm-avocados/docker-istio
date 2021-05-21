#!/bin/bash

ISTIO_VERSION="1.7.2"

ibmcloud plugin install -f kubernetes-service
sleep 2
ibmcloud login --apikey "${1}" -r "us-south"
sleep 2
ibmcloud ks cluster config --cluster $2
sleep 2
"/opt/istio-${ISTIO_VERSION}/bin/istioctl" install --set profile=demo
sleep 2
kubectl label namespace $3 istio-injection=enabled
sleep 2
kubectl apply -f "/opt/istio-${ISTIO_VERSION}/samples/bookinfo/platform/kube/bookinfo.yaml"
