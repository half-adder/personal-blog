#!/bin/bash

# Install obsidian-export if not present
if [ ! -x "bin/obsidian-export" ]; then
    echo "Installing obsidian-export..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source ~/.cargo/env
    cargo install obsidian-export
    # Remove existing symlink if it exists but isn't working
    rm -f bin/obsidian-export
    ln -s ~/.cargo/bin/obsidian-export bin/obsidian-export
fi

# Convert Obsidian vault to Hugo content
echo "Converting Obsidian vault to Hugo content..."
rm -rf content/*
bin/obsidian-export vault/ content/ --frontmatter always
bin/make-index-files content/

# Build Hugo site
echo "Building Hugo site..."
hugo --minify