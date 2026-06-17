{
  ...
}:
{
  system.defaults = {
    NSGlobalDomain = {
      # マウス/トラックパッド
      "com.apple.swipescrolldirection" = false; # ナチュラルスクロール
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
      autohide = true; # Automatically hide and show the Dock
      tilesize = 45; # Size of the icons in the dock. The default is 64.
      largesize = 75; # Magnified icon size on hover. The default is 16.
      showAppExposeGestureEnabled = false; # Whether to enable trackpad gestures to show App Exposé. The default is false.
      showMissionControlGestureEnabled = false; # Whether to enable trackpad gestures to show Mission Control. The default is false.
      showDesktopGestureEnabled = true; # Whether to enable four-finger spread gesture to show the Desktop. The default is false.
    };
  };
}
