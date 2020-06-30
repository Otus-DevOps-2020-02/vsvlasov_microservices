# vsvlasov_microservices
vsvlasov microservices repository

# ДЗ-12 "Технология контейнеризации. Введение в Docker"

##### Добавлен Docker, Dockerfile для сборки reddit images
Сборка образа:
```shell script
cd docker-monolith
docker build -t reddit:latest .
```
Паблишинг образа в Docker Hub:
```shell script
docker tag reddit:latest <your-login>/otus-reddit:1.0
docker push <your-login>/otus-reddit:1.0
```

##### Добавлены Terraform, Ansible, Packer
Собрать базоый образ docker-host с использованием Packer:
```shell script
cd docker-monolith/infra
packer build --var-file ./packer/variables.json ./packer/docker-host.json
```

Запуск инстансов GCP с Terraform:
```shell script
cd docker-monolith/infra/terraform
terraform apply
```

Запуск приложения внутри докера с использованием Ansible:
```shell script
cd docker-monolith/infra/ansible
ansible-playbook ./playbooks/site.yml
```

##### Other
- Добавлены pre-commit hooks
- Настроен travis


# ДЗ-13 "Docker-образы Микросервисы"
- Добавлены Dockerfile для post/comment/ui
- Оптимизированы размеры образов ui и comment

##### Оптимизация размеров образов ui и comment
- Сборка реализована через multi-stage build.
- Использован alpine дистрибутив
Итоговый размер каждого образа ~60 Мб

##### Сборка образов
Для сборки образов необходимо выполнить в директории `src`
```shell script
docker build -t <name>:<version> ./ui/
docker build -t <name>:<version> ./comment/
docker build -t <name>:<version> ./post-py/
```

##### Network alias
При смене алиасов приложение перестает работать.
Чтобы заменить ENV без пересборки образа, необходимо передать новые ENV параметры.
```shell script
docker run -d --network=reddit --network-alias=post_db_new --network-alias=comment_db_new mongo:latest
docker run -d --network=reddit --network-alias=post_new --env POST_DATABASE_HOST=post_db_new vvlineate/post:1.0
docker run -d --network=reddit --network-alias=comment_new --env COMMENT_DATABASE_HOST=comment_db_new vvlineate/comment:1.0
docker run -d --network=reddit -p 9292:9292 --env POST_SERVICE_HOST=post_new --env COMMENT_SERVICE_HOST=comment_new vvlineate/ui:2.0
```
