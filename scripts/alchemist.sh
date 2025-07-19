#!/bin/sh

# alchemist - Prepares a comfortable environment for Elixir programming…

function prepare_alchemist() {
    spew "Preparing Alchemist environment (Elixir)…"

    mise use -g erlang # Erlang is required for Elixir
    mise use -g elixir

    # TODO: iex customization(s) ???

    # =========================
    spew "Alchemist (Elixir) Configured." "+"
}
