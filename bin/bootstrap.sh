#!/bin/sh

system_name=$(uname -s)

function spew() {
    local message=$1
    local mode=${2:-"*"}
    local prefix="$mode$mode$mode"
    local host_name=$(uname -n)

    echo "$prefix | $host_name | $message"
}

if [ "$system_name" = "Darwin" ]; then
    # macOS
    spew "Darwin is macOS."
else
    # bail out
    spew "Not darwin. Not macOS. Unsupported" ">"
    echo ""
    exit 1
fi

# Install Homebrew if missing
if ! command -v brew >/dev/null 2>&1; then
    spew "Installing Homebrew…" "+"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    spew "Homebrew is available."
fi

TARGET="$(pwd)/Brewfile"
spew "Target: $TARGET"

if [ -f "$TARGET" ]; then
    spew "Bundling packages per target Brewfile…" "+"
    brew bundle --file=$TARGET
fi

# ===============
# FULL COMPLETION
spew "Bootstrap completed." "="
