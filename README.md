## Raspberry Pi (Raspbian) Provisioning Script
This is a convenient script for provisioning useful software on a fresh install of Raspbian. It currently:
- Installs ```git```, ```htop```, and ```vim```.
- Installs ```pyenv``` for managing Python installations.
- Installs ```docker```.
- Creates SSH keys, then prompts the user to upload them to GitLab (or other remotes).
- (Optional) Pulls dotfiles from GitLab and forms symbolic links.

### Installation
```bash
curl -sSL https://gitlab.com/zivia/raspberry_pi/raw/master/raspberry_pi.sh | bash
```