{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bundletool # Androidでストアにアップロード
    ccls # Objective-C用
    mdbook
    mdbook-mermaid
  ];
}
