#!/usr/bin/env bash

set -euo pipefail

# Dotfiles root
DOT_ROOT="$(cd "$(dirname "$0")" && pwd)"

# MAP: Relative path in project = Absolute system path
declare -A DOTFILES
DOTFILES["git/.gitconfig"]="$HOME/.gitconfig"

for SOURCE_REL in "${!DOTFILES[@]}"; do
    SOURCE="$DOT_ROOT/$SOURCE_REL"
    TARGET="${DOTFILES[$SOURCE_REL]}"

    # Dotfile not found in the project
    if [[ ! -e "$SOURCE" ]]; then
        echo -e "\033[33mMissing source (in project): $SOURCE_REL\033[0m"
        continue
    fi

    # Clear previous config
    if [[ -e "$TARGET" || -L "$TARGET" ]]; then
        rm -rf "$TARGET"
    fi

    # Make sure target path exists
    mkdir -p "$(dirname "$TARGET")"

    # Create symbolic link
    ln -s "$SOURCE" "$TARGET"
    echo -e "\033[32mLinked: $SOURCE_REL -> $TARGET\033[0m"
done

echo -e "\n\033[36mSetup complete!\033[0m"
