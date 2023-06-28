#!/bin/sh

kubectl apply -f git_configmap.yaml
kubectl apply -f azure_devops_configmap.yaml
kubectl apply -f gitops_configmap.yaml
kubectl apply -f base_images_info_configmap.yaml

