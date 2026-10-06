#!/usr/bin/env bash

# Require Bash 4.0+ (macOS issue)
if [ -z "$BASH_VERSION" ] || [ "${BASH_VERSINFO[0]}" -lt 4 ]; then
    echo "Error: This script requires Bash version 4.0+" >&2
    echo "Detected: ${BASH_VERSION:-unknown shell}" >&2
    echo "Interpreter path: $BASH" >&2
    exit 1
fi

set -euo pipefail

# Dotfiles root
DOT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Helper function for setup scripts
link_file() {
    local source="$1"
    local target="$2"

    if [[ ! -e "$source" ]]; then
        echo -e "\033[33mMissing source (in project): $source\033[0m"
        return
    fi

    if [[ -e "$target" || -L "$target" ]]; then
        rm -rf "$target"
    fi

    mkdir -p "$(dirname "$target")"
    ln -s "$source" "$target"
    echo -e "\033[32mLinked: $(basename "$source") -> $target\033[0m"
}

export -f link_file

echo -e "\033[36mStarting dotfiles setup...\033[0m\n"

# Iterate through subdirectories and run setup.sh
for SUBDIR in "$DOT_ROOT"/*/; do
    [[ -d "$SUBDIR" ]] || continue

    SETUP_SCRIPT="${SUBDIR}setup.sh"

    if [[ -f "$SETUP_SCRIPT" ]]; then
        MODULE_NAME="$(basename "$SUBDIR")"
        echo -e "\033[35m=== Module: $MODULE_NAME ===\033[0m"

        # Pass absolute module path as first argument ($1)
        bash "$SETUP_SCRIPT" "$(realpath "$SUBDIR")"
        echo ""
    fi
done

echo -e "\033[36mAll modules configured successfully!\033[0m"
