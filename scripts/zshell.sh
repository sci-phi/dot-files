#!/bin/sh

# zshell - Configures ZSH (custom prompts, etc.)
#
function prepare_zshell() {
    echo "source $(brew --prefix)/opt/spaceship/spaceship.zsh" >>! ~/.zshrc
}
