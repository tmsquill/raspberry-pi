#!/usr/bin/env bash

# Install tools.
sudo apt-get install git htop vim -y

# Set username and email for Git.
git config --global user.email "troysquillaci@gmail.com"
git config --global user.name "Troy Squillaci"

# Install pyenv for Python management.
curl https://pyenv.run | bash

cat >> ~/.bashrc << 'EOF'
export PATH="/home/user/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
EOF

# Generate SSH keys.
ssh-keygen -f id_rsa -N ''
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
