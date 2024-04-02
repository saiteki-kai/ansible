#!/bin/bash

ansible-playbook playbooks/laptop.yml --ask-become-pass --ask-vault-pass
