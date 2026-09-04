#!/bin/sh
set -eu

sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends autoconf automake autopoint nodejs npm texinfo
sudo npm install --global @openai/codex
