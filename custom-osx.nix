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

    # macos
    reattach-to-user-namespace
    terminal-notifier
    nerd-fonts.inconsolata
  ];
}
