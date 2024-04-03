# Personal Laptop Configuration with Ansible

This Ansible playbook simplifies and automates the setup and configuration of my personal Ubuntu laptop.

The installation process includes core packages, utility tools like curl, fzf, eza, and bat, along with essential applications such as the web browser, VLC, Spotify, and Telegram. Additionally, it involves configuring of SSH and GPG keys that are encrypted with Ansible Vault, configuring Oh-My-Zsh, installing Neovim from source, and setting up my [dotfiles](https://github.com/saiteki-kai/.dotfiles). Specifically for gnome, it also setup gnome shell extensions, default dconf settings, and keybindings.

## Install

Install ansible and run the playbook:

```bash
sudo apt install ansible
```

```bash
ansible-playbook playbooks/laptop.yml --ask-vault-pass --ask-become-pass
```

Some tasks have tags that can be used to filter the playbook. For example, `ansible-playbook playbooks/laptop.yml --tags minimal` will only run the tasks tagged as `minimal`. Similarly, tags can also be used to exclude tasks with the `--skip-tags` option.

## TODO

- [ ] Fetch and install the latest vscode release
- [ ] Set keybindings (Open the terminal, workspaces, etc)
- [ ] Install Gnome extensions
- [ ] Change the default DNS
- [ ] Rust, Nodejs, Latex

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
