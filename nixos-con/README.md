# my_shonky_nix
Beginners attempt

## So far ...
### System Flake
Needs to be abstracted - breaks everywhere else

### Home-Manager Flake
zsh not set as default

### Plumbing
From graphical ..  
Create dave user if not created and log into a dave session  
Install git and home-manager in shell (nix-shell -p git home-manager)  
Update /etc.nixos/configuration.nix for experimental features:

    nix.package = pkgs.nixUnstable;
    nix.extraOptions = ''
    experimental-features = nix-command flakes
    '';  
sudo nixos-rebuild switch  
git clone this repo and cd into it  
home-manager switch --flake .#dave
(received an error about nix profile so ran  
nix profile install nixpkgs#hello - this ran ok  
home-manager ran ok this time

### To do
Complete home manager configuration  
Work out system flake  
Run from minimal  




