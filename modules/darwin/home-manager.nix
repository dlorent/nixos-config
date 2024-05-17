{ config, pkgs, lib, home-manager, ... }:

let
  user = "dlorent";
  # Define the content of your file as a derivation
  myEmacsLauncher = pkgs.writeScript "emacs-launcher.command" ''
    #!/bin/sh
<<<<<<< HEAD
      emacsclient -c -n &
=======
    emacsclient -c -n &
>>>>>>> b3202fa (Initial commit with changes)
  '';
  sharedFiles = import ../shared/files.nix { inherit config pkgs; };
  additionalFiles = import ./files.nix { inherit user config pkgs; };
in
{
  imports = [
   ./dock
  ];

  # It me
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  homebrew = {
<<<<<<< HEAD
    # This is a module from nix-darwin
    # Homebrew is *installed* via the flake input nix-homebrew
=======
>>>>>>> b3202fa (Initial commit with changes)
    enable = true;
    casks = pkgs.callPackage ./casks.nix {};
    brews = pkgs.callPackage ./brews.nix {};

    # These app IDs are from using the mas CLI app
    # mas = mac app store
    # https://github.com/mas-cli/mas
    #
    # $ nix shell nixpkgs#mas
    # $ mas search <app name>
    #
    masApps = {
    };
  };

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    users.${user} = { pkgs, config, lib, ... }:{
      home = {
        enableNixpkgsReleaseCheck = false;
        packages = pkgs.callPackage ./packages.nix {};
        file = lib.mkMerge [
          sharedFiles
          additionalFiles
          { "emacs-launcher.command".source = myEmacsLauncher; }
        ];
<<<<<<< HEAD

        stateVersion = "23.11";
      };

=======
        stateVersion = "23.11";
      };
>>>>>>> b3202fa (Initial commit with changes)
      programs = {} // import ../shared/home-manager.nix { inherit config pkgs lib; };

      # Marked broken Oct 20, 2022 check later to remove this
      # https://github.com/nix-community/home-manager/issues/3344
      manual.manpages.enable = false;
    };
  };

  # Fully declarative dock using the latest from Nix Store
<<<<<<< HEAD
  local = {
    dock.enable = true;
    dock.entries = [
      { path = "/Applications/Slack.app/"; }
      { path = "/System/Applications/Messages.app/"; }
      { path = "/System/Applications/Facetime.app/"; }
      { path = "/Applications/Telegram.app/"; }
      { path = "${pkgs.alacritty}/Applications/Alacritty.app/"; }
      { path = "/System/Applications/Music.app/"; }
      { path = "/System/Applications/News.app/"; }
      { path = "/System/Applications/Photos.app/"; }
      { path = "/System/Applications/Photo Booth.app/"; }
      { path = "/System/Applications/TV.app/"; }
      { path = "${pkgs.jetbrains.phpstorm}/Applications/PhpStorm.app/"; }
      { path = "/Applications/TablePlus.app/"; }
      { path = "/Applications/Asana.app/"; }
      { path = "/Applications/Drafts.app/"; }
      { path = "/System/Applications/Home.app/"; }
      {
        path = toString myEmacsLauncher;
        section = "others";
      }
      {
        path = "${config.users.users.${user}.home}/.local/share/";
        section = "others";
        options = "--sort name --view grid --display folder";
      }
      {
        path = "${config.users.users.${user}.home}/.local/share/downloads";
        section = "others";
        options = "--sort name --view grid --display stack";
      }
    ];
  };
=======
  local.dock.enable = true;
  local.dock.entries = [
    { path = "/Applications/Chromium.app/"; }
    { path = "/Applications/Slack.app/"; }
    { path = "/Applications/Nix apps/Spotify.app/"; }
    { path = "/Applications/Discord.app/"; }
    { path = "${pkgs.alacritty}/Applications/Alacritty.app/"; }
    { path = "${config.users.users.${user}.home}/Applications/${"Home Manager Apps"}/VScodium.app/"; }
    {
      path = "${config.users.users.${user}.home}/.local/share/downloads";
      section = "others";
      options = "--sort name --view grid --display folder";
    }
  ];

>>>>>>> b3202fa (Initial commit with changes)
}
