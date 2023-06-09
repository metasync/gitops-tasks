ARG base_image_repo=mcr.microsoft.com/azure-cli
ARG base_image_tag=2.49.0
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

ENV GITOPS_HOME=/home/gitops
ENV HOME=${GITOPS_HOME}

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
    base_image_name=${base_image_repo}:${base_image_tag} \
    \
    azure_cli_version=${version}

RUN az extension add --name azure-devops \
    && apk -U upgrade \
    && apk --no-cache add jq \
    \
    && chown -R 1001:0 ${GITOPS_HOME} \
    && chmod -R g=u ${GITOPS_HOME}

USER 1001
