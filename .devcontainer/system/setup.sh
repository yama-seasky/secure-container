#!/bin/bash
sudo chown -R devuser:devuser ./
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
git config --global --add safe.directory /bara/repos.git


if [ ! -d "/workspace/.git" ]; then
    sudo mkdir -p /tmp/workspace_tmp
    sudo chown -R devuser:devuser /tmp/workspace_tmp
    sudo chmod 700 /tmp/workspace_tmp
    git clone $GIT_REPO_URL /tmp/workspace_tmp
    cp -r /tmp/workspace_tmp/. /workspace/
    sudo rm -rf /tmp/workspace_tmp
fi

sudo chown -R devuser:devuser ./

