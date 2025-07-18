#!/bin/sh

# rubyist - Prepares a 'Rubyist' environment…

function prepare_rubyist() {
    spew "Preparing Rubyist environment…"
    mise use -g ruby@3.4
    # TODO: default gemset
    # TODO: irb config
}
