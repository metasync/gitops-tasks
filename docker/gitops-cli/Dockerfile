ARG base_image_repo=alpine
ARG base_image_tag
ARG base_image_digest
FROM ${base_image_repo}:${base_image_tag}@${base_image_digest}

ARG project
ARG app
ARG version
ARG revision
ARG release_tag=rel
ARG build_number=0
ARG source
ARG build_context
ARG dockerfile
ARG image_repo
ARG image_tag
ARG base_image_repo
ARG base_image_tag
ARG base_image_digest

ARG TARGET_OS=linux
ARG TARGET_ARCH=amd64
ARG KUBECTL_VERSION=1.28.4
ARG KUSTOMIZE_VERSION=5.2.1
ARG KUBELINTER_VERSION=0.6.5
ARG OPENSHIFT_CLIENT_VERSION=4.12.29
ARG ARGOCD_CLI_VERSION=2.9.1

ENV GITOPS_HOME=/home/gitops
ENV HOME=${GITOPS_HOME}

ENV KREW_ROOT="${GITOPS_HOME}/.krew"

WORKDIR ${GITOPS_HOME}

LABEL tekton-ci.project=${project} \
    tekton-ci.app=${app} \
    tekton-ci.version=${version} \
    tekton-ci.revision=${revision} \
    tekton-ci.release_tag=${release_tag} \
    tekton-ci.build_number=${build_number} \
    tekton-ci.source=${source} \
    tekton-ci.build_context=${build_context} \
    tekton-ci.dockerfile=${dockerfile} \
    tekton-ci.maintainer="Metasync" \
    \
    tekton-ci.image_repo=${image_repo} \
    tekton-ci.image_tag=${image_tag} \
    tekton-ci.image_name=${image_repo}:${image_tag} \
    \
    tekton-ci.base_image_repo=${base_image_repo} \
    tekton-ci.base_image_tag=${base_image_tag} \
    tekton-ci.base_image_name=${base_image_repo}:${base_image_tag} \
    tekton-ci.base_image_digest=${base_image_digest} \
    \
    tekton-ci.kubectl_version=${KUBECTL_VERSION} \
    tekton-ci.kustomize_version=${KUSTOMIZE_VERSION} \
    tekton-ci.kube_linter_version=${KUBELINTER_VERSION} \
    tekton-ci.openshift_client_version=${OPENSHIFT_CLIENT_VERSION} \
    tekton-ci.argocd_cli_version=${ARGOCD_CLI_VERSION}

RUN apk -U upgrade \
    && apk --no-cache add gcompat curl git make yamllint jq yq skopeo \ 
    && set -ex; \
      curl -LO https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/${TARGET_OS}/${TARGET_ARCH}/kubectl \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/kubectl \
    \
    && set -ex; cd "$(mktemp -d)" && \
    OS="$(uname | tr '[:upper:]' '[:lower:]')" && \
    ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" && \
    KREW="krew-${OS}_${ARCH}" && \
    curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" && \
    tar zxvf "${KREW}.tar.gz" && \
    ./"${KREW}" install krew \
    && export PATH="${PATH}:${KREW_ROOT}/bin" \
    && kubectl krew install neat \
    \
    && set -ex; \
      curl -fL https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_${TARGET_OS}_${TARGET_ARCH}.tar.gz | tar xz \
    && chmod +x kustomize \
    && mv kustomize /usr/local/bin/kustomize \
    \
    && set -ex; \
      curl -fL https://github.com/stackrox/kube-linter/releases/download/v${KUBELINTER_VERSION}/kube-linter-${TARGET_OS} -o kube-linter \
    && chmod +x kube-linter \
    && mv kube-linter /usr/local/bin/kube-linter \
    \
    && set -ex; \
      curl -fL https://mirror.openshift.com/pub/openshift-v4/clients/ocp/${OPENSHIFT_CLIENT_VERSION}/openshift-client-${TARGET_OS}-${OPENSHIFT_CLIENT_VERSION}.tar.gz | tar xz \
    && chmod +x oc \
    && mv oc /usr/local/bin/oc \
    \
    && set -ex; \
      curl -sSL https://github.com/argoproj/argo-cd/releases/download/v${ARGOCD_CLI_VERSION}/argocd-linux-amd64 -o argocd \
    && chmod +x argocd \
    && mv argocd /usr/local/bin/argocd \
    \
    && chown -R 1001:0 ${GITOPS_HOME} \
    && chmod -R g=u ${GITOPS_HOME}

ENV PATH="${PATH}:${KREW_ROOT}/bin"

USER 1001
