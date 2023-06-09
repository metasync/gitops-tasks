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
    && apk --no-cache add git=${git_version} git-lfs git-flow \ 
          gpg openssh patch jq yq gettext \
    && git lfs install \
    \
    && mkdir ${GITOPS_HOME}/.ssh \
    && touch ${GITOPS_HOME}/.gitconfig \
    && chown -R 1001:0 ${GITOPS_HOME} \
    && chmod -R g=u ${GITOPS_HOME}

USER 1001
