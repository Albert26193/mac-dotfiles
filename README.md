# Mac Dotfiles

A collection of macOS configuration files and setup scripts to quickly configure your development environment. This repository includes configurations for various tools and a setup system that makes installation and updates easy.

## Features

- **Terminal Configuration**
  - Alacritty terminal emulator config
  - Starship prompt customization
  - Zellij terminal multiplexer settings
  - Tmux configuration

- **Window Management**
  - Aerospace configuration
  - Amethyst tiling window manager settings
  - Karabiner keyboard customization
  - Sketchybar (custom macOS menubar)
  - SKHD hotkey daemon

- **Shell Enhancement**
  - Oh-My-Zsh configuration
  - Zsh plugins:
    - zsh-syntax-highlighting
    - zsh-vi-mode
    - zsh-autosuggestions
    - fzf-tab

## Installation

1. Install Oh-My-Zsh and plugins:
```sh
bash scripts/install-omz-plugin.sh
```

2. Create symbolic links for configuration files:
```sh
bash scripts/softlink.sh
```

The softlink script will:
- Backup any existing configuration files (with date suffix)
- Create symbolic links from this repo to your home directory
- Ask for confirmation before overwriting existing configs

## Directory Structure

```
.
├── files/
│   ├── config/          # Configs that go in ~/.config/
│   │   ├── alacritty/
│   │   ├── karabiner/
│   │   ├── sketchybar/
│   │   ├── skhd/
│   │   └── ...
│   └── home/           # Configs that go in ~/
│       ├── .zshrc
│       ├── .vimrc
│       ├── .tmux.conf
│       └── ...
└── scripts/
    ├── install-omz-plugin.sh  # Install Oh-My-Zsh and plugins
    ├── softlink.sh           # Create config symlinks
    └── utils.sh             # Utility functions
```

Configure your macOS development environment with one touch! 🎉

## Note

- Before running the scripts, review the configurations to ensure they match your preferences
- The softlink script will prompt before overwriting existing configurations
- Backup files are created automatically with timestamp suffixes
