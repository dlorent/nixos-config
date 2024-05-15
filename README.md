# Nix Config for macOS + NixOS
[![Build Starter Template](https://github.com/dlorent/nixos-config/actions/workflows/build.yml/badge.svg)](https://github.com/dlorent/nixos-config/actions/workflows/build.yml)
[![Statix Lint](https://github.com/dlorent/nixos-config/actions/workflows/lint.yml/badge.svg)](https://github.com/dlorent/nixos-config/actions/workflows/lint.yml)

## Overview

Forked from [dustinlyons](https://github.com/dustinlyons/nixos-config) - all credit towards him! :)

Modified for my personal needs. lot's of documentation stripped away. Detailed documentation can be found at dustin's repo (https://github.com/dustinlyons/nixos-config)

## For macOS (May 2024)
This configuration supports both Intel and Apple Silicon Macs.

### 1. Install dependencies
```sh
xcode-select --install
```
### 2. Install Nix
Thank you for the [installer](https://zero-to-nix.com/concepts/nix-installer), [Determinate Systems](https://determinate.systems/)!
```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

```sh
mkdir -p nixos-config && cd nixos-config && nix flake --extra-experimental-features 'nix-command flakes' init -t github:dlorent/nixos-config#starter
```

### 4. Make [apps](https://github.com/dustinlyons/nixos-config/tree/main/apps) executable
```sh
find apps/$(uname -m | sed 's/arm64/aarch64/')-darwin -type f \( -name apply -o -name build -o -name build-switch -o -name create-keys -o -name copy-keys -o -name check-keys \) -exec chmod +x {} \;
```

### 5. Apply your current user info
Run this Nix command to replace stub values with your system properties, username, full name, and email.
> Email is only used in the `git` configuration.
```sh
nix run .#apply
```

### 9. Install configuration
Ensure the build works before deploying the configuration, run:
```sh
nix run .#build
```

### 10. Make changes
Finally, alter your system with this command:
```sh
nix run .#build-switch
```

## Features
- **Nix Flakes**: 100% flake driven, no `configuration.nix`, [no Nix channels](#why-nix-flakes)─ just `flake.nix`
- **Same Environment Everywhere**: Easily share config across Linux and macOS (both Nix and Home Manager)
- **macOS Dream Setup**: Fully declarative macOS (Apple / Intel) w/ UI, dock and macOS App Store apps
- **Simple Bootstrap**: Simple Nix commands to start from zero, both x86 and macOS platforms
- **Managed Homebrew**: Zero maintenance homebrew environment with `nix-darwin` and `nix-homebrew`
- **Disk Management**: Declarative disk management with `disko`, say goodbye to disk utils
- **Secrets Management**: Declarative secrets with `agenix` for SSH, PGP, syncthing, and other tools
- **Super Fast Emacs**: Bleeding edge Emacs that fixes itself, thanks to a [community overlay](https://github.com/nix-community/emacs-overlay)
- **Built In Home Manager**: `home-manager` module for seamless configuration (no extra clunky CLI steps)
- **NixOS Environment**: Extensively configured NixOS including clean aesthetic + window animations
- **Nix Overlays**: [Auto-loading of Nix overlays](https://github.com/dlorent/nixos-config/tree/main/overlays): drop a file in a dir and it runs _(great for patches!)_
- **Declarative Sync**: No-fuss Syncthing: managed keys, certs, and configuration across all platforms
- **Emacs Literate Configuration**: [Large Emacs literate configuration](https://github.com/dlorent/nixos-config/blob/main/modules/shared/config/emacs/config.org) to explore (if that's your thing)
- **Simplicity and Readability**: Optimized for simplicity and readability in all cases, not small files everywhere
- **Backed by Continuous Integration**: Flake auto updates weekly if changes don't break starter build


# Tools Overview

## Containers and Virtualization
- **[docker](https://github.com/docker/docker-ce)**  
  Platform for developing, shipping, and running applications in containers.
- **[docker-compose](https://github.com/docker/compose)**  
  Tool for defining and running multi-container Docker applications.
- **[k9s](https://github.com/derailed/k9s)**  
  Kubernetes CLI to manage and debug Kubernetes clusters.
- **[tailscale](https://github.com/tailscale/tailscale)**  
  Zero-config VPN to connect your devices securely.

## Development and Productivity
- **[gum](https://github.com/charmbracelet/gum)**  
  A tool for writing interactive and rich shell scripts.
- **[raycast](https://github.com/raycast/script-commands)**  
  Productivity tool to control your Mac, launch applications, and execute scripts quickly.
- **[veracrypt](https://github.com/veracrypt/VeraCrypt)**  
  Free open-source disk encryption software.

## Communication
- **[discord](https://discord.com)**  
  Free voice, video, and text chat app for gamers and communities.
- **[slack](https://slack.com)**  
  Collaboration hub that connects work with people through messaging, tools, and files.
- **[zoom](https://zoom.us)**  
  Video conferencing and online meeting platform.
- **[microsoft-teams](https://www.microsoft.com/en-us/microsoft-teams/group-chat-software)**  
  Collaboration platform that combines workplace chat, meetings, file storage, and app integration.

## Synchronization and File Management
- **[syncthing](https://github.com/syncthing/syncthing)**  
  Open-source continuous file synchronization program.

## Multimedia
- **[vlc](https://www.videolan.org/vlc/)**  
  Free and open-source cross-platform multimedia player and framework.
- **[spotify](https://www.spotify.com)**  
  Digital music service that gives you access to millions of songs.
- **[ffmpeg](https://github.com/FFmpeg/FFmpeg)**  
  Complete, cross-platform solution to record, convert and stream audio and video.

## Web Browsers
- **[eloston-chromium](https://github.com/Eloston/ungoogled-chromium)**  
  Ungoogled Chromium browser focusing on privacy, control, and transparency.

## Window Management
- **[rectangle](https://github.com/rxhanson/Rectangle)**  
  Window management app for macOS for snapping windows into various positions and sizes.

## Graphics and Fonts
- **[gimp](https://github.com/GNOME/gimp)**  
  Open-source raster graphics editor for image retouching and editing.
- **[emacs-all-the-icons-fonts](https://github.com/domtronn/all-the-icons.el)**  
  Icons for Emacs to improve user interface aesthetics.
- **[dejavu_fonts](https://github.com/dejavu-fonts/dejavu-fonts)**  
  Font family based on the Vera Fonts with additional characters.
- **[font-awesome](https://github.com/FortAwesome/Font-Awesome)**  
  Icon set and toolkit.
- **[hack-font](https://github.com/source-foundry/Hack)**  
  Typeface designed for source code with a focus on legibility.
- **[noto-fonts](https://github.com/googlefonts/noto-fonts)**  
  Font family designed to cover all the scripts encoded in the Unicode standard.
- **[noto-fonts-emoji](https://github.com/googlefonts/noto-emoji)**  
  Set of color and black-and-white emoji fonts.
- **[meslo-lgs-nf](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo/L)**  
  Customized version of Apple’s Menlo font with added Powerline glyphs.
- **[jetbrains-mono](https://github.com/JetBrains/JetBrainsMono)**  
  Typeface designed for coding with better readability.

## Terminals and Shells
- **[alacritty](https://github.com/alacritty/alacritty)**  
  A fast, GPU-accelerated terminal emulator.
- **[zsh-powerlevel10k](https://github.com/romkatv/powerlevel10k)**  
  Theme for Zsh that emphasizes speed, flexibility, and out-of-the-box experience.
- **[tmux](https://github.com/tmux/tmux)**  
  Terminal multiplexer to switch easily between several programs in one terminal.
- **[zellij](https://github.com/zellij-org/zellij)**  
  Terminal workspace with support for tabs, splits, and more.
- **[atuin](https://github.com/ellie/atuin)**  
  Enhanced shell history.

## Utilities
- **[microsoft-auto-update](https://support.microsoft.com/en-us/office/update-office-for-mac-automatic-updates-9f7a4a11-8b6a-4f38-9d24-944a8a55a16d)**  
  Tool for updating Microsoft applications on Mac.
- **[aspell](http://aspell.net)**  
  Spell-checking tool designed for various applications.
- **[aspellDicts.en](http://aspell.net)**  
  English dictionary for Aspell.
- **[bash-completion](https://github.com/scop/bash-completion)**  
  Script for command-line completion in Bash.
- **[bat](https://github.com/sharkdp/bat)**  
  Cat clone with syntax highlighting and Git integration.
- **[btop](https://github.com/aristocratos/btop)**  
  Resource monitor that shows usage and stats for processor, memory, disks, network, and processes.
- **[coreutils](https://www.gnu.org/software/coreutils/)**  
  Essential GNU utilities like `ls`, `cat`, and `rm`.
- **[killall](https://man7.org/linux/man-pages/man1/killall.1.html)**  
  Command to terminate all processes with a given name.
- **[neofetch](https://github.com/dylanaraps/neofetch)**  
  Command-line system information tool written in Bash.
- **[openssh](https://github.com/openssh/openssh-portable)**  
  Suite of secure networking utilities based on the SSH protocol.
- **[sqlite](https://sqlite.org/index.html)**  
  C library that provides a lightweight, disk-based database.
- **[wget](https://www.gnu.org/software/wget/)**  
  Network utility to retrieve files from the web using HTTP, HTTPS, and FTP.
- **[zip](https://linux.die.net/man/1/zip)**  
  Compression and file packaging utility.
- **[unzip](https://linux.die.net/man/1/unzip)**  
  Utility to list, test, and extract compressed files in a ZIP archive.
- **[unrar](https://www.rarlab.com/rar_add.htm)**  
  Extract files from RAR archives.
- **[lsd](https://github.com/Peltoche/lsd)**  
  Next-gen `ls` command with a lot of pretty colors and some additional features.
- **[htop](https://github.com/htop-dev/htop)**  
  Interactive process viewer for Unix systems.
- **[iftop](https://github.com/paulhenry/iftop)**  
  Display bandwidth usage on an interface by host.
- **[jq](https://github.com/stedolan/jq)**  
  Command-line JSON processor.
- **[ripgrep](https://github.com/BurntSushi/ripgrep)**  
  Line-oriented search tool that recursively searches your current directory for a regex pattern.
- **[tree](https://github.com/nodakai/tree-command)**  
  Recursive directory listing command that produces a depth-indented listing of files.

## Security and Encryption
- **[age](https://github.com/FiloSottile/age)**  
  Simple, modern, and secure file encryption tool.
- **[age-plugin-yubikey](https://github.com/str4d/age-plugin-yubikey)**  
  Plugin for using YubiKeys with age encryption.
- **[gnupg](https://github.com/gpg/gnupg)**  
  Free implementation of the OpenPGP standard for encrypting and signing data.
- **[libfido2](https://github.com/Yubico/libfido2)**  
  Library for FIDO 2.0 and CTAP2 based authentication.

## Cloud
- **[google-cloud-sdk](https://github.com/GoogleCloudPlatform/cloud-sdk-docker)**  
  CLI and libraries for interacting with Google Cloud services.