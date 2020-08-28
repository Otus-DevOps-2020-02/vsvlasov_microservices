SHELL := /bin/bash

USER_NAME=vvlineate

build_ui:
	cd src/ui && bash docker_build.sh

push_ui: docker_login
	docker push ${USER_NAME}/ui

build_comment:
	cd src/comment && bash docker_build.sh

push_comment: docker_login
	docker push ${USER_NAME}/comment

build_post:
	cd src/post-py && bash docker_build.sh

push_post: docker_login
	docker push ${USER_NAME}/post

build_prometheus:
	cd monitoring/prometheus && docker build -t ${USER_NAME}/prometheus .

push_prom: docker_login
	docker push ${USER_NAME}/prometheus

build_all: build_ui build_comment build_post build_prometheus

docker_login:
	docker login

docker_push_all: push_comment push_post push_prom push_ui
