{
  description = "MacAbee nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
  let
    configuration = { pkgs, config, ... }: {
      system.primaryUser = "abee";

      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
          pkgs.vim
          pkgs.eza
          pkgs.fd
          pkgs.kubernetes-helm
          pkgs.lazygit
          pkgs.zoxide
          pkgs.lua-language-server
          pkgs.neofetch
          pkgs.zsh-powerlevel10k
          pkgs.prettierd
          pkgs.stylua
          pkgs.talosctl
          pkgs.typescript-language-server
          pkgs.wget
          pkgs.yaml-language-server
          pkgs.yamllint
          pkgs.zsh-autosuggestions
          pkgs.zsh-syntax-highlighting
          pkgs.kubectl
          pkgs.kompose
          pkgs._1password-gui
        ];

      fonts.packages = with pkgs; [
          fira-code
          fira-code-symbols
          nerd-fonts.fira-code
      ];

      homebrew = {
        enable = true;
        brews = [
          "mas"
        ];
        casks = [
          "alfred"
          "appcleaner"
          "kitty"
          "mos"
          "rectangle"
        ];
         # look for id with mas search
        masApps = {
          "Noir" = 1592917505;
          "Wireguard" = 1451685025;
          "PL2303-Serial" = 1624835354;
          "Pixelmator-Pro" = 1289583905;
          "Things3" = 904280696;
          "1Password-Safari" = 1569813296;
          "Amphetamine" = 937984704;
        };
        onActivation.cleanup = "zap";
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;
      programs.zsh.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#BabeeMac
    darwinConfigurations."BabeeMac" = nix-darwin.lib.darwinSystem {
      modules = [ 
        configuration 
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            enableRosetta = true;

            # User owning the Homebrew prefix
            user = "abee";

            # Automatically migrate existing Homebrew installations
            autoMigrate = true;
          };
        }
      ];
    };
  };
}
