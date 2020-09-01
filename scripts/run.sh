#!/bin/bash

ISTIO_VERSION="1.7.0"

ibmcloud plugin install -f kubernetes-service
sleep 20
ibmcloud login --apikey $1 -r "us-south"
sleep 20
ibmcloud ks cluster config --cluster $2
sleep 20
"/opt/istio-${ISTIO_VERSION}/bin/istioctl" install --set profile=demo
sleep 20
kubectl label namespace $3 istio-injection=enabled
sleep 20
kubectl apply -f "/opt/istio-${ISTIO_VERSION}/samples/bookinfo/platform/kube/bookinfo.yaml"
