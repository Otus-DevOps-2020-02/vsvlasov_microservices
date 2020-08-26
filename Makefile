SHELL := /bin/bash

USER_NAME=vvlineate
USERNAME=vvlineate

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

build_telegraf:
	cd monitoring/telegraf && docker build -t ${USER_NAME}/telegraf .

push_telegraf: docker_login
	docker push ${USER_NAME}/telegraf

build_prometheus:
	cd monitoring/prometheus && docker build -t ${USER_NAME}/prometheus .

push_prom: docker_login
	docker push ${USER_NAME}/prometheus

build_alertmanager:
	cd monitoring/alertmanager && docker build -t ${USER_NAME}/alertmanager .

push_alertmanager: docker_login
	docker push ${USER_NAME}/alertmanager

build_fluentd:
	cd logging/fluentd && docker build -t ${USER_NAME}/fluentd .

push_fluentd: docker_login
	docker push ${USER_NAME}/fluentd

build_all: build_ui build_comment build_post build_prometheus build_telegraf build_alertmanager build_fluentd

docker_login:
	docker login

docker_push_all: push_comment push_post push_prom push_ui push_fluentd push_alertmanager push_telegraf


run_app:
	cd docker && \
	docker-compose -f docker-compose.yml up -d && \
	docker-compose -f docker-compose-logging.yml up -d
