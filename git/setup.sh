#!/usr/bin/env bash
set -euo pipefail

MODULE_DIR="$1"

rm -f "$HOME/.gitconfig"

link_file "$MODULE_DIR/.gitconfig" "$HOME/.gitconfig"
