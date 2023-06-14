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
ARG git_version

ENV WORKSPACE_ROOT=/workspace
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
    git_version=${git_version}

RUN apk -U upgrade \
    && apk --no-cache add git=${git_version} \ 
          gpg openssh patch jq yq gettext \
    \
    && mkdir -p ${WORKSPACE_ROOT}/source \
    && touch ${WORKSPACE_ROOT}/source/.gitconfig \
    && ln -s ${WORKSPACE_ROOT}/source/.gitconfig ${GITOPS_HOME}/.gitconfig \
    && mkdir -p ${WORKSPACE_ROOT}/ssh-directory \
    && ln -s ${WORKSPACE_ROOT}/ssh-directory ${GITOPS_HOME}/.ssh \
    && chown -R 1001:0 ${WORKSPACE_ROOT} \
    && chmod -R g=u ${WORKSPACE_ROOT} \
    && chown -R 1001:0 ${GITOPS_HOME} \
    && chmod -R g=u ${GITOPS_HOME}

USER 1001
