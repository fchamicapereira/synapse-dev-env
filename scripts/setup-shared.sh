#!/usr/bin/bash

set -euo pipefail

shared=/shared
workspace=/home/docker/workspace

if [ -z "$(ls -A $shared)" ]; then
    # Shared folder is empty, so let's use copy all the boilerplate to the shared folder
    echo "Setting up shared folder, this might take a bit..."
    sudo cp -r $workspace/. $shared/
    sudo chown -R docker:docker $shared/
    echo "Done!"
fi

# Point the container workspace to the shared folder
sudo rm -rf $workspace
sudo ln -s $shared $workspace
