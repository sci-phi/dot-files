# Rubyist Environment

A rubyist is a programmer of the friendly object-oriented language Ruby. These fine people, myself included, need a comfortable environment to work with their familiar tools when configuring a new system.

## Mise

`mise` a.k.a. [mise-en-place](https://mise.jdx.dev/lang/ruby.html) is an alternative to [ASDF](https://asdf-vm.com) both of which are primarily used to manage multiple versions of the same runtime (Java, NodeJS, Ruby, etc.) for programmers.

### Basic Install

During bootstrap, the Rubyist script will be invoked, which will use `mise` to install a "global" Ruby

```
mise use -g ruby@3.4
```
