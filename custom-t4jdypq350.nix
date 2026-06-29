{ pkgs, ... }:

{
  home.packages = with pkgs; [
    awsume
    git-lfs
  ];
}
