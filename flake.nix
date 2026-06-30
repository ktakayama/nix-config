{
  description = "Home Manager configuration of takayama";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    git-hooks-nix = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      nix-index-database,
      git-hooks-nix,
      ...
    }:
    let
      username = "takayama";
      darwinHomedir = "/Users/${username}";
      darwinSystem = "aarch64-darwin";
      checkPkgs = nixpkgs.legacyPackages.${darwinSystem};

      pre-commit-check = git-hooks-nix.lib.${darwinSystem}.run {
        src = ./.;
        hooks = {
          gitleaks = {
            enable = true;
            name = "gitleaks";
            entry = "${checkPkgs.gitleaks}/bin/gitleaks git --pre-commit --redact --staged --verbose";
            pass_filenames = false;
          };
          nixfmt-rfc-style.enable = true;
        };
      };

      mkHome =
        { system, extraModules }:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            nix-index-database.homeModules.nix-index
            ./home.nix
          ]
          ++ extraModules;
        };

      mkDarwin = nix-darwin.lib.darwinSystem {
        specialArgs = {
          inherit self;
          inherit username;
          homedir = darwinHomedir;
        };
        modules = [ ./darwin/configuration.nix ];
      };
    in
    {
      homeConfigurations = {
        # "takayama@polaris" = mkHome {
        #   system = "x86_64-linux";
        #   modules = [ ./custom-linux.nix ];
        # };

        # "takayama@raspberrypi" = mkHome {
        #   system = "aarch64-linux";
        #   modules = [ ./custom-linux.nix ];
        # };

        # T4JDYPQ350
        "takayama@T4JDYPQ350" = mkHome {
          system = darwinSystem;
          extraModules = [
            ./custom-osx.nix
            ./custom-t4jdypq350.nix
          ];
        };

        # フォールバック
        "takayama" = mkHome {
          system = darwinSystem;
          extraModules = [
            ./custom-osx.nix
            ./custom-hawk.nix
          ];
        };
      };

      darwinConfigurations = {
        T4JDYPQ350 = mkDarwin;
        hawk = mkDarwin;
        raven = mkDarwin;
      };

      checks.${darwinSystem}.pre-commit-check = pre-commit-check;

      devShells.${darwinSystem}.default = checkPkgs.mkShell {
        inherit (pre-commit-check) shellHook;
        buildInputs = pre-commit-check.enabledPackages;
      };
    };
}
