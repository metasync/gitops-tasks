#!/bin/sh

kubectl apply -f service_account.yaml
kubectl apply -f tekton_ci_clusterrole.yaml
kubectl apply -f tekton_ci_clusterrole_binding.yaml
kubectl apply -f tekton_tekton_ci_role.yaml
kubectl apply -f tekton_role_binding.yaml
kubectl apply -f tekton_cluster_role_binding.yaml
kubectl apply -f argocd_tekton_ci_role.yaml
kubectl apply -f argocd_tekton_ci_role_binding.yaml
