#!/bin/sh

# bootstrap : Use Homebrew to resolve any dependencies for target system

set -e

DOT_FILES_PATH=$(cd "$(dirname "$0")/.."; pwd)

UNAME_HOST=$(uname -n)
UNAME_SYSTEM=$(uname -s)

# ====================
# FUNCTION DEFINITIONS
# ====================

function dts() {
    date -u +"%Y%m%d-%H%M%S"
}

# spew wrapper fn around echo to reduce inline "noise"
function spew() {
    local message=$1
    local mode=${2:-"*"}
    local prefix="$mode$mode$mode"

    echo "$(dts) | $UNAME_HOST | $prefix | $message"
}

# ==================
# ~ MAIN OPERATION ~
# ==================

if [ "$UNAME_SYSTEM" = "Darwin" ]; then
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

TARGET="$DOT_FILES_PATH/Brewfile"
spew "Target: $TARGET"

if [ -f "$TARGET" ]; then
    spew "Bundling packages per target Brewfile…" "+"
    brew bundle --file=$TARGET
fi

source "$DOT_FILES_PATH/scripts/zshell.sh"
prepare_zshell

source "$DOT_FILES_PATH/scripts/rubyist.sh"
prepare_rubyist

# ======================
# . SCRIPT TERMINATION .
spew "Bootstrap completed." "="
