#!/bin/bash

ansible-playbook local.yml --verbose --ask-become-pass --ask-vault-pass
