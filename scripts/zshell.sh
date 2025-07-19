#!/bin/sh

# zshell - Configures ZSH (custom prompts, etc.)
#

DOT_FILES_BACKUP_DIR="~/.backup/config"

function backup_file() {
    local label=$1 # What <REQUIRED>
    local path=$2 # Where <REQUIRED>
    local reason=$3 # Why <optional>
    local bu_dts=$(dts) # When

    if [ -f "$path" ]; then
        spew "Backing up previous '$label' configuration..."

        local item_dir=$(dirname $path)
        local item_name=$(basename $path)
        local bu_folder="$DOT_FILES_BACKUP_DIR/$label"

        mkdir -p $DOT_FILES_BACKUP_DIR # Redundant?
        mkdir -p $bu_folder

        local target="$bu_folder/$item_name.$bu_dts"
        spew "'$item' => '$target'"

        cp $item $target
    fi
}

function configure_spaceship() {
    local configuration_path="~/.config/spaceship/spaceship.zsh"

    if [ -f "$configuration_path" ]; then
        backup_file "spaceship" $configuration_path

        rm $configuration_path # DELETE *PREVIOUS* SPACESHIP CONFIG
    fi

    # === Spaceship Activation ===
    echo "source $(brew --prefix)/opt/spaceship/spaceship.zsh" >> ~/.zshrc
    # <-*->
    # NOTE: presumes 'FRESH' zshrc file w/o previous spaceship activation…

    # === Spaceship Customization ===
    mkdir -p $(dirname $configuration_path)

    local template_path=$DOT_FILES_PATH/config/zsh/spaceship/spaceship.zsh

    cp $template_path $configuration_path

    # ==============================
    spew "Spaceship configured." "~"
}

function prepare_zshell() {
    local configuration_path="~/.zshrc"

    if [ -f "$configuration_path" ]; then
        backup_file "zsh" $configuration_path

        rm $configuration_path # DELETE ***previous*** ZSH Config
    fi

    # Copy ZSH Config template for a FRESH start…
    cp $DOT_FILES_PATH/config/zsh/default.zsh ~/.zshrc

    # RECORD INSTALLATION TIMESTAMP
    echo "DOT_FILES_INSTALLED_AT=$(dts)" >> ~/.zshrc

    # CONTINUE with sub-configurations of ZSH…
    configure_spaceship

    # =========================
    spew "ZSH Configured." "="
}
