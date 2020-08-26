docker-machine scp ./daemon.json docker-host:/tmp/daemon.json
docker-machine ssh docker-host "sudo cp /tmp/daemon.json /etc/docker/ && sudo systemctl restart docker"
