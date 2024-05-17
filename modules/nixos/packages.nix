{ pkgs }:

with pkgs;
let shared-packages = import ../shared/packages.nix { inherit pkgs; }; in
shared-packages ++ [

  # Security and authentication
<<<<<<< HEAD
  _1password-gui
=======
>>>>>>> b3202fa (Initial commit with changes)
  yubikey-agent
  keepassxc

  # App and package management
  appimage-run
  gnumake
  cmake
  home-manager

  # Media and design tools
<<<<<<< HEAD
  gimp
  vlc
  wineWowPackages.stable
  fontconfig
  font-manager

  # Printers and drivers
  brlaser # printer driver

  # Calculators
=======
  vlc
  fontconfig
  font-manager

  # Productivity tools
>>>>>>> b3202fa (Initial commit with changes)
  bc # old school calculator
  galculator

  # Audio tools
  cava # Terminal audio visualizer
  pavucontrol # Pulse audio controls

<<<<<<< HEAD
  # Messaging and chat applications
  cider # Apple Music on Linux
  discord
  hexchat # Chat
  fractal # Matrix.org messaging app
  #tdesktop # telegram desktop

  # Testing and development tools
  beekeeper-studio
  cypress # Functional testing framework using headless chrome
  chromedriver
  direnv
  rofi
  rofi-calc
  qmk
  postgresql
  libusb1 # for Xbox controller
=======
  # Testing and development tools
  direnv
  rofi
  rofi-calc
  postgresql
>>>>>>> b3202fa (Initial commit with changes)
  libtool # for Emacs vterm

  # Screenshot and recording tools
  flameshot
<<<<<<< HEAD
  simplescreenrecorder

  # Text and terminal utilities
  emote # Emoji picker
=======

  # Text and terminal utilities
>>>>>>> b3202fa (Initial commit with changes)
  feh # Manage wallpapers
  screenkey
  tree
  unixtools.ifconfig
  unixtools.netstat
  xclip # For the org-download package in Emacs
  xorg.xwininfo # Provides a cursor to click and learn about windows
  xorg.xrandr

  # File and system utilities
  inotify-tools # inotifywait, inotifywatch - For file system events
  i3lock-fancy-rapid
  libnotify
<<<<<<< HEAD
  ledger-live-desktop
  playerctl # Control media players from command line
  pcmanfm # Our file browser
=======
  pcmanfm # File browser
>>>>>>> b3202fa (Initial commit with changes)
  sqlite
  xdg-utils

  # Other utilities
<<<<<<< HEAD
  yad # I use yad-calendar with polybar
=======
  yad # yad-calendar is used with polybar
>>>>>>> b3202fa (Initial commit with changes)
  xdotool
  google-chrome

  # PDF viewer
  zathura

  # Music and entertainment
  spotify
<<<<<<< HEAD

  # VR
  immersed-vr
=======
>>>>>>> b3202fa (Initial commit with changes)
]
