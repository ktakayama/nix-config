{
  ...
}:
{
  system.defaults = {
    CustomUserPreferences = {
      # Globalキー 何もしない
      "com.apple.HIToolbox".AppleFnUsageType = 0;
    };

    CustomUserPreferences.NSGlobalDomain = {
      # ウインドウのタイトルバーをダブルクリックした時の動作
      AppleActionOnDoubleClick = "None";

      NSCloseAlwaysConfirmsChanges = true; # 閉じる時に変更保持を確認
      NSQuitAlwaysKeepsWindows = true; # 終了時もウインドウ復元（=UIトグルはOFF）
    };

    NSGlobalDomain = {
      # サウンド
      "com.apple.sound.beep.feedback" = 1;
      "com.apple.sound.beep.volume" = 0.6;

      # マウス/トラックパッド
      "com.apple.swipescrolldirection" = false; # ナチュラルスクロール
      "com.apple.trackpad.scaling" = 2.5;

      # キーボード
      KeyRepeat = 2; # キーのリピート速度
      InitialKeyRepeat = 25; # リピート入力認識までの時間
    };

    # トラックパッド タップでクリック
    trackpad.Clicking = true;

    WindowManager = {
      EnableTilingByEdgeDrag = false; # 左右端ドラッグでタイル
      EnableTopTilingByEdgeDrag = false; # メニューバーへドラッグでフルスクリーン
      EnableTilingOptionAccelerator = false; # ⌥ドラッグでタイル
      EnableTiledWindowMargins = false; # タイルに隙間

      EnableStandardClickToShowDesktop = false; # 壁紙をクリックしてデスクトップを表示
    };

    # メニューバー
    controlcenter = {
      # 再生中を非表示
      NowPlaying = false;
    };

    # Finder
    finder = {
      AppleShowAllExtensions = true; # Whether to always show file extensions. The default is false.
      ShowPathbar = true; # Show path breadcrumbs in finder windows. The default is false.
      FXEnableExtensionChangeWarning = false; # Whether to show warnings when change the file extension of files. The default is true.
      FXPreferredViewStyle = "Nlsv"; # Change the default finder view. “icnv” = Icon view, “Nlsv” = List view, “clmv” = Column View, “Flwv” = Gallery View The default is icnv.
    };

    # Dock
    dock = {
      persistent-apps = [
        { app = "/System/Applications/iPhone Mirroring.app"; }
      ];

      "wvous-br-corner" = 4; # ホットコーナー右下 = デスクトップ
      mru-spaces = false; # 操作スペースの自動並べ替え
      expose-group-apps = true; # ウインドウをアプリごとにグループ化

      autohide = true; # Automatically hide and show the Dock
      magnification = true; # Magnified icons
      tilesize = 45; # Size of the icons in the dock. The default is 64.
      largesize = 75; # Magnified icon size on hover. The default is 16.
      showAppExposeGestureEnabled = false; # Whether to enable trackpad gestures to show App Exposé. The default is false.
      showMissionControlGestureEnabled = false; # Whether to enable trackpad gestures to show Mission Control. The default is false.
      showDesktopGestureEnabled = true; # Whether to enable four-finger spread gesture to show the Desktop. The default is false.
    };
  };
}
