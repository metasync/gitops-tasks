ARG base_image_repo=alpine
ARG base_image_tag=3.18.0
FROM ${base_image_repo}:${base_image_tag}

ARG project
ARG app
ARG version
ARG revision
ARG source
ARG build_context
ARG dockerfile
ARG image_repo
ARG image_tag
ARG base_image_repo
ARG base_image_tag

ARG TARGET_OS=linux
ARG TARGET_ARCH=amd64
ARG KUBECTL_VERSION=1.27.2
ARG KUSTOMIZE_VERSION=5.0.3
ARG KUBELINTER_VERSION=0.6.4
ARG OPENSHIFT_CLIENT_VERSION=4.10.28

ENV GITOPS_HOME=/home/gitops
ENV HOME=${GITOPS_HOME}

ENV KREW_ROOT="${GITOPS_HOME}/.krew"

WORKDIR ${GITOPS_HOME}

LABEL project=${project} \
    app=${app} \
    version=${version} \
    revision=${revision} \
    source=${source} \
    build_context=${build_context} \
    dockerfile=${dockerfile} \
    maintainer="Metasync" \
    \
    image_repo=${image_repo} \
    image_tag=${image_tag} \
    image_name=${image_repo}:${image_tag} \
    \
    base_image_repo=${base_image_repo} \
    base_image_tag=${base_image_tag} \
    base_image_name=${base_image_repo}:${base_image_tag}

RUN apk -U upgrade \
    && apk --no-cache add curl yamllint jq yq skopeo \ 
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
    && chown -R 1001:0 ${GITOPS_HOME} \
    && chmod -R g=u ${GITOPS_HOME}

USER 1001
