import '../../shared/models/wallpaper.dart';

class WallpaperState {
  final Wallpaper? wallpaperInfo;
  final bool isWallpaperSet;
  final int downloadProgress;

  WallpaperState({
    this.wallpaperInfo,
    this.isWallpaperSet = false,
    this.downloadProgress = 0,
  });
}
