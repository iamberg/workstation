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
* [AWS Cli](https://aws.amazon.com/cli/)
* [docker](https://www.docker.com)
* docker-compose
* [VS Code](https://code.visualstudio.com)

### Music
* [Spotify](https://www.spotify.com)
## New Machine Setup
For a new machine, I run the following command to set up my computer

```bash
wget -qO- \ 
https://github.com/iamberg/workstation/raw/main/run.sh | \
bash
```

This will prompt you for your `sudo` password for the bash script, and then once later for ansibles "BECOME PASSWORD" prompt.