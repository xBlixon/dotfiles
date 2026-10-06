#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$1"
CONFIG_FILE="$HOME/.tmux.conf"

rm -f $CONFIG_FILE
rm -rf "$HOME/.tmux"

link_file "$MODULE_DIR/.tmux.conf" $CONFIG_FILE

git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
