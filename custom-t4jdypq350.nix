{ pkgs, ... }:

{
  home.packages = with pkgs; [
    awsume
    awscli2
    git-lfs
  ];
}
