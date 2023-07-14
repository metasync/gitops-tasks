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
ARG git_version

ENV WORKSPACE_ROOT=/workspace
ENV GITOPS_HOME=/home/gitops
ENV HOME=${GITOPS_HOME}

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
    tekton-ci.git_version=${git_version}

RUN apk -U upgrade \
    && apk --no-cache add git=${git_version} \ 
          gpg openssh patch jq yq gettext \
    \
    && mkdir -p ${WORKSPACE_ROOT}/source \
    && touch ${WORKSPACE_ROOT}/source/.gitconfig \
    && ln -s ${WORKSPACE_ROOT}/source/.gitconfig ${GITOPS_HOME}/.gitconfig \
    && chown -R 1001:0 ${WORKSPACE_ROOT} \
    && chmod -R g=u ${WORKSPACE_ROOT} \
    && chown -R 1001:0 ${GITOPS_HOME} \
    && chmod -R g=u ${GITOPS_HOME}

USER 1001
