import 'package:Palettes/app/cubit/wallpaper_state.dart';
import 'package:bloc/bloc.dart';

import '../cubit/wallpaper_cubit.dart';

class WallpaperCubit extends Cubit<WallpaperState> {
  WallpaperCubit() : super(WallpaperState());

  // Method to set wallpaper
  Future<void> setWallpaper({
    required wallpaperEntity,
    required int screenLocation,
  }) async {
    // Your implementation here
  }

  // Method to download wallpaper
  Future<void> downloadWallpaper({required String url}) async {
    // Your implementation here
  }
}
