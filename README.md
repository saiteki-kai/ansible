# Ansible Playbook

## Requirements

- Ubuntu 23.10
- Ansible

## Keys Encryption

Export your gpg private and public keys:

```bash
gpg --export-secret-keys -a -o ./roles/user/files/gpg_github/private.asc
gpg --export -a -o ./roles/user/files/gpg_github/public.asc
```

For the ssh keys you can just copy the files from `.ssh`:

```bash
cp ~/.ssh/id_ed25519 ./roles/user/files/ssh_github/id_ed25519
cp ~/.ssh/id_ed25519.pub ./roles/user/files/ssh_github/id_ed25519.pub
```

Encrypt the private keys with ansible vault:

```bash
ansible-vault encrypt ./roles/user/files/gpg_github/private.asc
ansible-vault encrypt ./roles/user/files/ssh_github/id_ed25519
```
