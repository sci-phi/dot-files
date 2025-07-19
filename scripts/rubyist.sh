#!/bin/sh

# rubyist - Prepares a comfortable environment for Ruby programming…

function prepare_rubyist() {
    spew "Preparing Rubyist environment…"

    mise use -g ruby@3.4
    mise exec ruby@3.4 -- ruby --version

    # TODO: default gemset
    # TODO: irb config

    # =========================
    spew "Ruby Configured." "+"
}
