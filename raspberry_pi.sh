#!/usr/bin/env bash
set -e

info () {
    echo
    echo
    echo "$1"
    echo
    echo
}

# Install tools.
info "Installing Tools - git, htop, vim"
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git vim

# Install pyenv for Python management.
info "Installing Tools - pyenv"
curl https://pyenv.run | bash

cat >> ~/.bashrc << 'EOF'
export PATH="/home/pi/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
EOF

# Install Docker
info "Installing Tools - docker"
curl -sSL https://get.docker.com | sh

# Generate SSH keys.
info "Generating SSH Keys"
ssh-keygen -f $HOME/.ssh/id_rsa -N ''
echo
cat ~/.ssh/id_rsa.pub
echo

# Install dotfiles from GitLab.
read -p "If you want to pull dotfiles from GitLab, register your SSH keys then choose (y), otherwise choose (n): " -n 1 -r
echo 
if [[ $REPLY =~ ^[Yy]$ ]]
then
    git clone git@gitlab.com:zivia/dotfiles.git
fi 
