#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$1"
CONFIG_PATH="$HOME/.config/nvim"

rm -rf $CONFIG_PATH

link_file $MODULE_DIR $CONFIG_PATH
