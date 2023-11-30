#!/bin/bash

kubectl apply -f gitops_project_trigger_template.yaml
kubectl apply -f gitops_project_trigger.yaml

kubectl apply -f gitops_repo_trigger_template.yaml
kubectl apply -f gitops_repo_trigger.yaml

kubectl apply -f quay_repo_trigger_template.yaml
kubectl apply -f quay_repo_trigger.yaml

kubectl apply -f kube_app_trigger_template.yaml
kubectl apply -f kube_app_trigger.yaml

kubectl apply -f argocd_app_trigger_template.yaml
kubectl apply -f argocd_app_trigger.yaml

kubectl apply -f quay_image_check_trigger.yaml
kubectl apply -f quay_image_check_trigger_template.yaml

kubectl apply -f quay_image_rebuild_trigger.yaml
kubectl apply -f quay_image_rebuild_trigger_template.yaml

kubectl apply -f tekton_ci_event_listener.yaml
kubectl apply -f tekton_ci_event_listener_ingress.yaml
