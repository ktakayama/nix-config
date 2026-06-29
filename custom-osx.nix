{ pkgs, ... }:

{
  home.homeDirectory = "/Users/takayama";

  home.packages = with pkgs; [
    # rclone for macOS
    #(rclone.override { enableCmount = false; })
    rclone

    # development
    swiftlint
    fvm
    rustup
    terraform-ls

    # macos
    reattach-to-user-namespace
    terminal-notifier
    nerd-fonts.inconsolata
  ];
}
