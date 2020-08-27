# K8S the hard way
- Prerequisites
  - Setup Gcloud SDK
  - Set a default compute region and compute zone
  - install tmux

- Installing the Client Tools
  - Install cfssl & cfssljson
  - Install Kubectl

- Provisioning Compute Resources
  - Add VPC
  - Add Subnet
  - Add Firewall rules
  - Add static public IP for k8s
  - Add compute instances:

    GCP has a limitation on free tier, we should create 2 controllers and 2  instead of 3/3

  - SSH access

- Provisioning the CA and Generating TLS Certificates
  - Add Certificate Authority to generate additional certs
  - Client and Server Certificates
    - Make Admin Client Certificate
    - Make Kubelet Client Certificates
    - Make Controller Manager Client Certificate
    - Make Kube Proxy Client Certificate
    - Make Scheduler Client Certificate
    - Make Kubernetes API Server Certificate
  - Make Service Account Key Pair
  - Distribute the Client and Server Certificates

- Generating Kubernetes Configuration Files for Authentication
  - Generate kubelet Kubernetes Configuration File
  - Generate kube-proxy Kubernetes Configuration File
  - Generate kube-controller-manager Kubernetes Configuration File
  - Generate kube-scheduler Kubernetes Configuration File
  - Generate admin Kubernetes Configuration File
  - Distribute the Kubernetes Configuration Files

- Generating the Data Encryption Config and Key
  - Generate encription key
  - Create Encryption Config File and copy to each controller

- Bootstrapping the etcd Cluster

  Use tmux to run on multiple instances

  - Download and Install the etcd Binaries
  - Configure the etcd Server
  - Start the etcd Server

        sudo systemctl start etcd

    Know issue: Failed by timeout, use Tmux and run on all instances

- Bootstrapping the Kubernetes Control Plane

  Use tmux to run on multiple instances

  - Provision the Kubernetes Control Plane
    - Download and Install the Kubernetes Controller Binaries
    - Configure the Kubernetes API Server
    - Configure the Kubernetes Controller Manager
    - Configure the Kubernetes Scheduler
    - Start the Controller Services
  - Enable HTTP Health Checks
  - RBAC for Kubelet Authorization
  - The Kubernetes Frontend Load Balancer

- Bootstrapping the Kubernetes Worker Nodes
  - Provisioning a Kubernetes Worker Node
  - Disable Swap
  - Download and Install Worker Binaries
  - Configure CNI Networking
  - Configure containerd
  - Configure the Kubelet
  - Configure the Kubernetes Proxy
  - Start the Worker Services

- Configuring kubectl for Remote Access
- Provisioning Pod Network Routes
  - Create routes
- Deploying the DNS Cluster Add-on
- Smoke Test
  - Deploy Nginx
  - Add port-forwarding
  - Make Curl request
  - Check access to pod logs
  - Try Exec pod
  - Expose Nginx NodePort and create Firewall rule to allow 80 port
  - Make Curl request to EXTERNAL_IP

- Cleaning Up
