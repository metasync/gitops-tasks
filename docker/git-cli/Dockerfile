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

LABEL project=${project} \
    app=${app} \
    version=${version} \
    revision=${revision} \
    release_tag=${release_tag} \
    build_number=${build_number} \
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
    base_image_digest=${base_image_digest} \
    \
    git_version=${git_version}

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
