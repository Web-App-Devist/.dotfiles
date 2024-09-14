#!/bin/bash

ansible-playbook ~/init/init.yml --ask-become-pass

echo "Ansible installation complete."
