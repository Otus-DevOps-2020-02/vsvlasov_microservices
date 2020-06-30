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
