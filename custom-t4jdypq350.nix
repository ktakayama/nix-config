{ pkgs, ... }:

{
  home.packages = with pkgs; [
    awsume
    awscli2
    ssm-session-manager-plugin
    git-lfs
  ];
}
