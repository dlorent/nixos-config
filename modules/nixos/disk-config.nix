_: {
<<<<<<< HEAD
  # This is the disk layout for a dual-boot system with Windows 10.
  disko.devices = {
    disk = {
      nvme0n1 = {
        device = "/dev/nvme0n1";
=======
  # This formats the disk with the ext4 filesystem
  # Other examples found here: https://github.com/nix-community/disko/tree/master/example
  disko.devices = {
    disk = {
      vdb = {
        device = "/dev/%DISK%";
>>>>>>> b3202fa (Initial commit with changes)
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
<<<<<<< HEAD
              type = "EF00";  # EFI partition type.
              size = "500M";
=======
              type = "EF00";
              size = "100M";
>>>>>>> b3202fa (Initial commit with changes)
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
<<<<<<< HEAD
              start = "901G";  # Start immediately after Windows partition.
              size = "100%";  # Takes the remaining half of the disk space.
=======
              size = "100%";
>>>>>>> b3202fa (Initial commit with changes)
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}
