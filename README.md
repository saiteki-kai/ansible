# Personal Laptop Configuration with Ansible

This Ansible playbook simplifies and automates the setup and configuration of my personal Ubuntu laptop.

The installation process includes core packages, utility tools like curl, fzf, eza, and bat, along with essential applications such as the web browser, VLC, Spotify, and Telegram. Additionally, it involves configuring of SSH and GPG keys that are encrypted with Ansible Vault, configuring Oh-My-Zsh, installing Neovim from source, and setting up my [dotfiles](https://github.com/saiteki-kai/.dotfiles). Specifically for gnome, it also setup gnome shell extensions, default dconf settings, and keybindings.

## Prerequisites

Before running the playbook, ensure you have performed a fresh installation of Ubuntu 24.04.

## Install

1\. Install git and ansible:

```bash
sudo apt install git ansible
```

2\. Clone the repository:

```bash
git clone https://github.com/saiteki-kai/ansible.git
cd ansible/
```

3\. Setup the vault password:

Create a vault password file `.vault_pass` in the root directory and ensure it's only accessible by the current user:

```bash
sudo chown $USER:$USER .vault_pass
sudo chmod 0600 .vault_pass
```

Alternatively, you can use the `--ask-vault-pass` flag to pass the vault password.

4\. Run the install script:

```bash
./install.sh                   # or
./install.sh --ask-vault-pass  # pass the vault password
```

Some tasks have tags that can be used to filter the playbook. For example, `./install.sh --tags minimal` will only run the tasks tagged as `minimal`. Similarly, tags can also be used to exclude tasks with the `--skip-tags` option.

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
