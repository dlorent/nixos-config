<img src="https://user-images.githubusercontent.com/1292576/190241835-41469235-f65d-4d4b-9760-372cdff7a70f.png" width="48">

# Dustin's Nix / NixOS config
![GitHub last commit](https://img.shields.io/github/last-commit/dustinlyons/nixos-config?style=plastic)

# Overview
> "All we have to decide is what to do with the time that is given us." - J.R.R. Tolkien

Well, well, well, look who we have here! 🤓

You've stumbled upon my personal journey with Nix. For over a year, I've been hacking away on this configuration. It drives the machines I use daily, my office PC and laptop, in addition to the VMs running in my home lab. As a guiding principle, I've done my best to keep it as simple as possible - for both future me and readers like you. I hope you'll see discover this in how I've organized the code.

To get you started, I've included my [steps for bootstrapping a new virtual machine](https://github.com/dustinlyons/nixos-config/blob/main/vm/README.md) that also works on bare metal. For MacOS, there are a few dependencies you need to install which I've detailed below. And if you're new to Emacs, check out my [literate configuration](https://github.com/dustinlyons/nixos-config/blob/main/common/config/emacs/Emacs.org). Emacs is at the core of my workflow and is much more than just an IDE.

# Layout

```
.
├── bin          # Simple scripts used to wrap the build
├── common       # Shared configurations applicable to all machines
├── hardware     # Hardware-specific configuration
├── macos        # MacOS and nix-darwin configuration
├── nixos        # My NixOS desktop-related configuration
├── overlays     # Drop an overlay file in this dir, and it runs. So far mainly patches.
└── vms          # VM-specific configs running in my home-lab
```

# Bootstrap New Computer

## Step 1 - For MacOS, install Nix package manager
Install the nix package manager, add unstable channel:
```sh
sh <(curl -L https://nixos.org/nix/install) --daemon
```
```sh
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
```
```sh
nix-channel --update
```

## Step 2 - For NixOS, create a disk partition and install media
Follow this [step-by-step guide](https://github.com/dustinlyons/nixos-config/blob/main/vm/README.md) for instructions to install using `ZFS` or `ext3`.


## Step 3 - Install home-manager
Add the home-manager channel and install it:
```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
```
```sh
nix-channel --update
```

## Step 4 - If MacOS, install Darwin dependencies
Install Xcode CLI tools and nix-darwin:
```sh
xcode-select --install
```
```sh
nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
```
```sh
./result/bin/darwin-installer
```

## Step 5 - Build the environment
Download this repo and run:
```sh
./bin/build
```

## Step 6 - Add Yubikey and generate key
Insert Yubikey and generate private keys
```sh
ssh-keygen -t ecdsa-sk
```

## Step 7 - Reboot computer
That's it. You're done.

# Update Computer

## Download the latest updates and update lock file
```sh
nix flake update
```
## Run  build
```sh
./bin/build
```

## You made it this far
Add me on [Twitter](https://twitter.com/dustinhlyons).

_Thank you Nix and the [communities](https://github.com/nix-community/emacs-overlay) around [nixpkgs](https://github.com/NixOS/nixpkgs)._
