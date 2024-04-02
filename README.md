# Ansible Playbook

Ansible playbook for my setup on Ubuntu.

## Requirements

- Ubuntu 23.10
- Ansible

## Install

Install ansible and run the playbook:

```bash
sudo apt install ansible
```

```bash
ansible-playbook playbooks/laptop.yml --ask-vault-pass --ask-become-pass
```

## TODO

- [ ] Fetch latest vscode release
- [ ] Keybindings (Open the terminal, workspaces, etc)
- [ ] Gnome Extensions
- [ ] DNS

## Keys Encryption

Export your gpg private and public keys:

```bash
gpg --export-secret-keys -a -o ./playbooks/files/gpg_github/private.asc
gpg --export -a -o ./playbooks/files/gpg_github/public.asc
```

For the ssh keys you can just copy the files from `~/.ssh`:

```bash
cp ~/.ssh/id_ed25519 ./playbooks/files/ssh_github/id_ed25519
cp ~/.ssh/id_ed25519.pub ./playbooks/files/ssh_github/id_ed25519.pub
```

Encrypt the private keys with ansible vault:

```bash
ansible-vault encrypt ./playbooks/files/gpg_github/private.asc
ansible-vault encrypt ./playbooks/files/ssh_github/id_ed25519
```
