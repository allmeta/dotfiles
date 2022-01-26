#!/bin/bash
mkdir -p ~/.config
mkdir -p ~/.local/share
cd dots && stow -t ~ *
