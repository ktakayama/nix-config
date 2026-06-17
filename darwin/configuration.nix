{
  self,
  username,
  homedir,
  ...
}:
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  programs.zsh.enable = true;

  users.users.${username} = {
    home = homedir;
  };

  system = {
    # 後方互換性のための値、nix-darwin 本体のバージョン依存
    # 原則、各自がインストールした際に設定した値のままにする
    stateVersion = 6;

    # ビルド時の設定ファイルのコミット位置を記録
    configurationRevision = self.rev or self.dirtyRev or null;

    # Mac 本体のユーザー設定を変更する際に必要
    primaryUser = username;
  };

  # sudoをTouchID対応
  security.pam.services.sudo_local = {
    touchIdAuth = true;
    reattach = true; # tmux内で必要
  };

  # /etc/nix/nix.conf
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    always-allow-substitutes = true;
    bash-prompt-prefix = "(nix:$name) ";
    max-jobs = "auto";
    extra-nix-path = "nixpkgs=flake:nixpkgs";
    keep-derivations = true;
    keep-outputs = true;
    trusted-users = [
      "root"
      username
    ];
  };

  # system profileの自動GC
  nix.gc = {
    automatic = true;
    interval = {
      Weekday = 0;
      Hour = 3;
      Minute = 0;
    };
    options = "--delete-older-than 14d";
  };

  # store内のリンク整理
  nix.optimise.automatic = true;

  imports = [
    ./system.nix
  ];
}
