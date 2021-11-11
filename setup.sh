#!/bin/sh

echo "Installing ansible ..."
sudo apt update
sudo apt -y install software-properties-common python3-jmespath
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt update
sudo apt -y install ansible

echo "Preparing setup playbook ..."
git clone https://github.com/ob1-sc/wsl-setup --recurse-submodules

echo "Running setup playbook ..."
sudo ansible-playbook \
	--extra-vars "user=$(whoami) ansible_python_interpreter=/usr/bin/python3" \
	--connection=local \
	--inventory 127.0.0.1, \
	./wsl-setup/ansible-playbook/local.yml
