#!/bin/bash

# GitOps bootstrap
kubectl apply -f gitops_bootstrap/gitops_project_pipeline.yaml
kubectl apply -f gitops_bootstrap/gitops_repo_pipeline.yaml
kubectl apply -f gitops_bootstrap/quay_repo_pipeline.yaml
kubectl apply -f gitops_bootstrap/kube_app_pipeline.yaml
kubectl apply -f gitops_bootstrap/argocd_app_pipeline.yaml

# GitOps operations
kubectl apply -f gitops_operations/quay_image_check_updates_pipeline.yaml
kubectl apply -f gitops_operations/quay_image_rebuild_pipeline.yaml
