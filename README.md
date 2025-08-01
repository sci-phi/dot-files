# dot-files

Manages "Dot" files for system setup and customization…

## Setup

You can use the [chezmoi](https://chezmoi.io) binary install method for this repository:

```
sh -c "$(curl -fsLS get.chezmoi.io)" --init --apply git@github.com:sci-phi/dot-files.git
```

## Install

Next, you need to have [Homebrew](https://brew.sh) installed, which can be done via:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Bundle

Then, you can use the `brew bundle` command in conjunction with this `Brewfile` to install dependencies.

### MISE EN PLACE

> [Mise](https://mise.jdx.dev) is a polyglot tool version manager. It replaces tools like asdf, nvm, pyenv, rbenv, etc.

Mise is enabled for ZSH via the eval command added to `~/.zshrc`

#### Ruby

On a macOS system, there is an OLD ruby pre-installed from Apple (v2.6.10 - last patched in 2022) and then another `portable` Ruby installed for Brew's internal use, but which should not be relied upon for your development purposes, as it is subject to change w/o recourse.

`mise install ruby`

This will install the `latest` version of Ruby available. Once the install has completed, you can instruct mise to make the latest Ruby version available by default:

`mise use --global ruby@latest`

#### Elixir requires Erlang

Elixir is an oddball here, in that it requires Erlang (with OTP) be available first, which makes it very slightly more complicated to get up and running.

```
mise install erlang elixir
mise use --global erlang@latest elixir@latest
```
