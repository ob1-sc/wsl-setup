#!/bin/sh

git clone https://github.com/ob1-sc/wsl-setup --recurse-submodules

sudo ansible-playbook \
	--extra-vars "user=$(whoami) ansible_python_interpreter=/usr/bin/python3" \
	--connection=local \
	--inventory 127.0.0.1, \
	.wsl-setup/ansible-playbook/local.yml
