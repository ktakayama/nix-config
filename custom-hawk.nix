{ pkgs, ... }:

{
   home.packages = with pkgs; [
      rustup
      bundletool # Androidでストアにアップロード
      ccls       # Objective-C用
   ];
}
