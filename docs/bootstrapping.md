# Usage

## Bootstrapping a new system.

The goal is to build up a working system from 'scratch', via the simplest common entry-point, the shell environment.

### macOS - Apple Command Line Tools

First, we need some Command Line Tools to build up our custom environment. Apple makes it very easy to install the Xcode Command Line Tools on a fresh system.

Open `Terminal.app` and execute the command `xcode-select --install` then follow the dialog prompts.

### Git

Once Git is installed, we can use it to pull down this repository __via the HTTP protocol__:

`git clone https://github.com/sci-phi/dot-files.git`

NOTE: The target system is "fresh" so we do not yet have enough configuration to support authenticated Git operations, but this is a public repository so HTTP access is sufficient.

### Homebrew

The automation approach I am using for a macOS system requires using [Homebrew](https://brew.sh) which should be installed via the "curl exec" method :

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install dot-file Dependencies

The `Brewfile` in this repository should support the rest of the installation steps that can be exposed in a public github repository.

```
cd dot-files
brew bundle
```
