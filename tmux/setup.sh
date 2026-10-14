#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$1"
CONFIG_FILE="$HOME/.tmux.conf"
MACOS_CONFIG_FILE="$HOME/.macos.tmux.conf"

rm -f $CONFIG_FILE
rm -rf "$HOME/.tmux"

link_file "$MODULE_DIR/.tmux.conf" $CONFIG_FILE

if [[ "$OSTYPE" == "darwin"* ]]; then
	rm -f $MACOS_CONFIG_FILE
	link_file "$MODULE_DIR/.macos.tmux.conf" $MACOS_CONFIG_FILE
#else
	#Linux to be added later
fi
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
