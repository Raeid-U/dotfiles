# --------------------------------
# configuration.nix -- raeid-u
# --------------------------------
{ config, pkgs, ... }:

{
  # include auto-generated hardware config
  imports = [ ./hardware-configuration.nix ];

  # use systemd-boot as EFI boot loader
  boot.loader.systemd-boot.enable = true;
  # allow EFI variable updates
  boot.loader.efi.canTouchEfiVariables = true;

  # enable NetworkManager for networking
  # easiest wireless and wired management
  networking.networkmanager.enable = true;

  # set system timezone to Toronto
  time.timeZone = "America/Toronto";

  # set locale to US English UTF-8
  i18n.defaultLocale = "en_US.UTF-8";

  # allow unfree packages (for NVIDIA driver)
  nixpkgs.config.allowUnfree = true;

  # define default user
  users.users.raeid = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "render" ];
    # use bash as default shell
    shell = pkgs.bash;
  };

  # install common tools and apps
  environment.systemPackages = with pkgs; [
    vim
    wget
    neovim
    gedit
    alacritty
    firefox
  ];

  # enable bash support
  programs.bash.enable = true;

  # apply Intel CPU microcode updates
  hardware.cpu.intel.updateMicrocode = true;

  # enable X11 server and Sway tiling WM
  # tiling WM
  services.xserver.enable = true;
  # use Sway as window manager
  services.xserver.windowManager.sway.enable = true;

  # load NVIDIA proprietary driver
  # GPU drivers
  services.xserver.videoDrivers = [ "nvidia" ];

  # enable OpenGL support
  hardware.opengl.enable = true;

  # configure NVIDIA settings
  # enable KMS modesetting
  hardware.nvidia.modesetting.enable = true;
  # keep persistence daemon
  hardware.nvidia.persistence = true;
  # use proprietary driver package
  hardware.nvidia.package = pkgs.nvidia_x11;

  # load necessary NVIDIA kernel modules
  boot.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
  ];

  # enable CUDA support
  hardware.cuda.enable = true;

  # enable PolicyKit
  services.polkit.enable = true;

  # enable Home Manager for user-level config
  programs.home-manager.enable = true;

  # system version for compatibility
  system.stateVersion = "25.05";
}
