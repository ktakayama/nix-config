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
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      nix-index-database,
      ...
    }:
    let
      username = "takayama";
      darwinHomedir = "/Users/${username}";

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
          system = "aarch64-darwin";
          extraModules = [
            ./custom-osx.nix
            ./custom-t4jdypq350.nix
          ];
        };

        # フォールバック
        "takayama" = mkHome {
          system = "aarch64-darwin";
          extraModules = [
            ./custom-osx.nix
            ./custom-hawk.nix
          ];
        };
      };

      darwinConfigurations = {
        T4JDYPQ350 = mkDarwin;
        hawk = mkDarwin;
      };
    };
}
