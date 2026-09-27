# Dotfiles

My personal NixOS configuration, focused on Android development, machine learning, and general software engineering workflows.

The goal of this setup is to provide a reproducible development environment which remains easy to modify and extend.

## Features

* Neovim-based development environment
* Terminal-focused workflow
* Android development tooling and configuration
* Machine learning and data science tooling
* Shell customization
* Tmux configuration
* Wayland/Linux desktop customizations

## Requirements

Before installing these dotfiles, ensure the following tools are available:

* Git
* GNU Stow

## Installation

### 1. Clone the Repository

Clone the repository into your home directory (or another location of your choice):

```bash
git clone https://github.com/ryanbernsteinsbu/dotfiles.git
cd dotfiles
```

### 2. Deploy the Dotfiles

This repository uses GNU Stow to manage symbolic links.

Run:

```bash
stow . --no-folding
```

The `--no-folding` option prevents Stow from creating directory-level symlinks and instead creates links for individual files.

