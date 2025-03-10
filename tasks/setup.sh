#!/bin/bash

kubectl apply -f bootstrap_gitops_repos.yaml
kubectl apply -f bootstrap_kube_apps.yaml
kubectl apply -f bootstrap_quay_repos.yaml
kubectl apply -f bootstrap_argocd_apps.yaml

kubectl apply -f create_azure_repo.yaml
kubectl apply -f add_azure_repo_policies.yaml
kubectl apply -f init_gitops_workspace.yaml
kubectl apply -f clone_kustomize_template.yaml
kubectl apply -f create_gitops_deployment.yaml
kubectl apply -f clone_gitops_deployment.yaml
kubectl apply -f update_gitops_deployment.yaml

kubectl apply -f create_quay_repo.yaml
kubectl apply -f mirror_quay_repo.yaml

kubectl apply -f create_kube_app.yaml

kubectl apply -f create_argocd_app.yaml
kubectl apply -f sync_argocd_app.yaml

kubectl apply -f check_quay_image_on_base_image_updates.yaml
kubectl apply -f trigger_quay_image_rebuild.yaml

kubectl apply -f fetch_quay_image_labels.yaml
kubectl apply -f init_github_workspace.yaml
kubectl apply -f clone_quay_image_source.yaml

kubectl apply -f get_deployment_by_argocd_app.yaml
kubectl apply -f get_latest_image_by_argocd_app.yaml
kubectl apply -f restart_deployment.yaml