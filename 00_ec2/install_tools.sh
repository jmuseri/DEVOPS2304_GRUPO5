#!/bin/bash

echo "Installing AWS CLI"

curl -sSL https://awscli.amazonaws.com/awscli-v2/install | bash -

echo "Installing kubectl"

curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -sSL https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/.kube
sudo mv ./kubectl /usr/local/bin/kubectl
export PATH=$PATH:/usr/local/bin
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
kubectl version --client

echo "Installing eksctl"

curl -sLO https://github.com/aws/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz
tar xzvf eksctl_$(uname -s)_amd64.tar.gz
sudo mv eksctl /usr/local/bin
export PATH=$PATH:/usr/local/bin
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
eksctl version

echo "Installing Docker"

sudo yum install -y docker.io

sudo usermod -a -G docker ec2-user
newgrp docker

echo "Installing Helm"
#  There is no official yum package for Helm yet. You'll need to install it using a different method like the script provided in the official documentation: https://helm.sh/docs/intro/install/

echo "Installing Terraform"

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum install -y terraform
