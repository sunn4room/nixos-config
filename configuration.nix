{ config, pkgs, ... }: {
  system.stateVersion = "26.05";
  boot.initrd.availableKernelModules = ["ata_piix" "ohci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod"];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  disko.devices.disk.main.device = "/dev/sda";
  disko.devices.disk.main.type = "disk";
  disko.devices.disk.main.content.type = "gpt";
  disko.devices.disk.main.content.partitions.ESP.type = "EF00";
  disko.devices.disk.main.content.partitions.ESP.size = "512M";
  disko.devices.disk.main.content.partitions.ESP.content.type = "filesystem";
  disko.devices.disk.main.content.partitions.ESP.content.format = "vfat";
  disko.devices.disk.main.content.partitions.ESP.content.mountpoint = "/boot";
  disko.devices.disk.main.content.partitions.ESP.content.mountOptions = [ "umask=0077" ];
  disko.devices.disk.main.content.partitions.root.size = "100%";
  disko.devices.disk.main.content.partitions.root.content.type = "filesystem";
  disko.devices.disk.main.content.partitions.root.content.format = "ext4";
  disko.devices.disk.main.content.partitions.root.content.mountpoint = "/";
  networking.hostName = "nixos";
  users.users.sunny.isNormalUser = true;
  users.users.sunny.initialPassword = "sunny";
  users.users.sunny.extraGroups = ["wheel"];
  environment.systemPackages = with pkgs; [
    vis
    wget
  ];
  services.openssh.enable = true;
}
