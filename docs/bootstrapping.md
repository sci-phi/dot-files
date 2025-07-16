# Usage

## Bootstrapping a new system.

The goal is to build up a working system from scratch, via the simplest common entry-point, the shell environment.

### macOS

The automation approach I am using for a macOS system requires using [Homebrew](https://brew.sh) but before we can get to that, we want to install the Command Line Tools from Apple. Apple makes it very easy to install Xcode Command Line Tools on a fresh system, by hooking certain very common shell commands used for software development, so that the first issue triggers a prompt for CLI installation.

#### Git

The `git` command is the natural choice here (but `gcc` or `clang` will also work) as getting this repo onto the target system requires git anyway.

_**TODO: Document installation of Command Line Tools**_

Once Git is installed, we can use it to pull down this repository __via the HTTP protocol__:

`git clone https://github.com/sci-phi/dot-files.git`

This is a public repository, and the target system is "fresh" so we do not yet have enough configuration to support using the SSH protocol for Git operations.
