{ pkgs, ... }:

let
  # fvm 4.0.5 固定用の nixpkgs スナップショット
  pkgs-pinned = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/d33369954a67ae3322177dc9a3d564092912120c.tar.gz";
    sha256 = "sha256-bG1LAS3YehMzp4RSXw99o3yMEO/Ktb0Tx29RCtEU0Tk=";
  }) { system = pkgs.stdenv.hostPlatform.system; };
in
{
  home.homeDirectory = "/Users/takayama";

  home.packages = with pkgs; [
    # rclone for macOS
    #(rclone.override { enableCmount = false; })
    rclone

    # development
    swiftlint
    pkgs-pinned.fvm # 4.0.5 固定
    rustup
    terraform-ls

    # macos
    reattach-to-user-namespace
    pkgs-pinned.terminal-notifier
    nerd-fonts.inconsolata
  ];
}
