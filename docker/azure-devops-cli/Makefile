include Makefile.env

build:
	@${CONTAINER_CLI} build . -t $(IMAGE_NAME) \
		--build-arg project=$(PROJECT_NAME) \
		--build-arg app=$(APP_NAME) \
		--build-arg version=$(APP_VERSION) \
		--build-arg revision=$(APP_REVISION) \
		--build-arg source=$(APP_SOURCE) \
		--build-arg build_context=$(APP_CONTEXT) \
		--build-arg dockerfile=$(APP_DOCKERFILE) \
		--build-arg image_repo=$(IMAGE_REPO) \
		--build-arg image_tag=$(IMAGE_TAG) \
		--build-arg base_image_repo=$(BASE_IMAGE_REPO) \
		--build-arg base_image_tag=$(BASE_IMAGE_TAG) \
		--build-arg base_image_digest=$(BASE_IMAGE_DIGEST) \
		--build-arg release_tag=$(RELEASE_TAG) \
		--build-arg build_number=$(BUILD_NUMBER) \
		&& ${CONTAINER_CLI} image tag $(IMAGE_NAME) $(IMAGE_REGISTRY_NAME)

push:
	@${CONTAINER_CLI} push $(IMAGE_REGISTRY_NAME)

run:
	@${CONTAINER_CLI} run --rm -it \
		-v ${HOME}/.ssh:${GITOPS_HOME}/.ssh \
		${IMAGE_NAME}

prune:
	@${CONTAINER_CLI} image prune -f

clean: prune

.PHONY: build push run \
				prune clean