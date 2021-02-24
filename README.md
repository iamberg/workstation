# workstation

## Ansible Playbook to setup my workstation.

Manages installation of applications and configuration of dotfiles.

## Software
The software installed by either scripts or ansible playbook:

### Package management
* [Flatpak](https://flatpak.org)
* [Snap](https://snapcraft.io)

### Chat clients
* [Slack](https://slack.com)

### Development tools
* [Ansible](https://www.ansible.com)
* [AWS cli](https://aws.amazon.com/cli/)
* AWS SAM cli
* [AWS CDK](https://aws.amazon.com/cdk/)
* [docker](https://www.docker.com)
* docker-compose
* [nvm](https://github.com/nvm-sh/nvm)
* [Node.js](https://nodejs.org)
* [VS Code](https://code.visualstudio.com)

### Music
* [Spotify](https://www.spotify.com)

### Dotfiles management
* [chezmoi](https://github.com/twpayne/chezmoi)
## Dotfiles
I manage my dotfiles with [chezmoi](https://github.com/twpayne/chezmoi) since it has integrations with password managers and supports gpg encryption.

Running the Ansible playbook will install chezmoi and initialize from my dotfiles repository at [https://github.com/iamberg/dotfiles](https://github.com/iamberg/dotfiles)

## New Machine Setup
For a new machine, I run the following command to set up my computer

```bash
wget -qO- \ 
https://github.com/iamberg/workstation/raw/main/run.sh | \
bash
```

This will prompt you for your `sudo` password for the bash script, and then once later for ansibles "BECOME PASSWORD" prompt.