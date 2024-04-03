#!/bin/bash

set -euo pipefail

ansible-playbook playbooks/laptop.yml --ask-become-pass $@

if [[ -f .vault_pass ]]; then
    echo "Do you want to remove the vault password file? (y/n)"
    read answer

    if [ "$answer" == "y" ]; then
        rm .vault_pass
        echo ".vault_pass file removed successfully!"
    fi

    echo
fi

echo "Setup complete successfully!"
