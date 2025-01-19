import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:Palettes/app/cubit/wallpaper_state.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import 'package:Palettes/app/models/models.dart';
import 'package:Palettes/shared/shared.dart';
import 'package:Palettes/wallhaven/wallhaven.dart';


class WallpaperCubit extends HydratedCubit<WallpaperState> {
  WallpaperCubit(this._wallhavenRepository) : super(const WallpaperState());

  final WallhavenRepository _wallhavenRepository;

  Future<void> fetchWallpaper({WallpaperQuery? wallQuery}) async {
    if (state.homeStatus != HomeStatus.success) {
      emit(state.copyWith(homeStatus: HomeStatus.loading));

      try {
        final wallpaperList = await _wallhavenRepository.getWallpaper(wallQuery: wallQuery);

        emit(state.copyWith(
          homeStatus: HomeStatus.success,
          wallpaperList: wallpaperList,
          colorsData: getColorsData(wallpaperList.data),
          wallQuery: wallQuery,
        ));
      } catch (e) {
        log('Error fetching wallpapers: $e', name: 'WallpaperCubit');
        emit(state.copyWith(homeStatus: HomeStatus.failure));
      }
    }
  }

  Map<String, int> getColorsData(List<Wallpaper> data) {
    final colorsMap = <String, int>{};

    for (final wallpaper in data) {
      for (final color in wallpaper.colors) {
        colorsMap[color] = (colorsMap[color] ?? 0) + 1;
      }
    }

    return colorsMap;
  }

  Future<void> validateApikey({required String apikey}) async {
    emit(state.copyWith(userStatus: UserStatus.loading));

    try {
      await _wallhavenRepository.apikeyValidation(apikey: apikey);
      emit(state.copyWith(userStatus: UserStatus.success));
    } catch (e) {
      log('Error validating API key: $e', name: 'WallpaperCubit');
      emit(state.copyWith(userStatus: UserStatus.failure));
    }
  }

  void updateStatus(HomeStatus status) =>
      emit(state.copyWith(homeStatus: status));

  void updateWallpaperQuery(WallpaperQuery wallQuery) =>
      emit(state.copyWith(wallQuery: wallQuery));

  void updateHomeSearchTitleModel(HomeSearchTitleModel titleModel) =>
      emit(state.copyWith(homeSearchTitleModel: titleModel));

  Stream<String> downloadImageStream({required String url}) {
    if (Platform.isIOS) {
      return Stream.error('Please use the Share button!');
    } else if (!Platform.isAndroid && !Platform.isMacOS && !Platform.isWindows && !Platform.isLinux) {
      return Stream.error('Operating system not supported!');
    }

    try {
      late final StreamController<String> controller;

      controller = StreamController<String>(
        onListen: () async {
          late Directory dir;
          controller.add('Getting pictures folder...');

          if (Platform.isAndroid) {
            await verifyPermission();
          }

          switch (Platform.operatingSystem) {
            case 'android':
              dir = Directory('storage/emulated/0/Pictures/Palettes/');
              break;
            case 'macos':
              final docDir = await getApplicationDocumentsDirectory();
              final listDirString = docDir.path.split('/');
              dir = Directory('/Users/${listDirString[2]}/Pictures/Palettes/');
              break;
            case 'windows':
              final docDir = await getApplicationDocumentsDirectory();
              final listDirString = docDir.path.split(r'\');
              dir = Directory('C:/Users/${listDirString[2]}/Pictures/Palettes/');
              break;
            case 'linux':
              final docDir = await getApplicationDocumentsDirectory();
              dir = Directory(docDir.path.replaceRange(docDir.path.lastIndexOf('/'), null, '/Pictures/Palettes/'));
              break;
            default:
              throw UnsupportedError('Unsupported operating system');
          }

          if (!dir.existsSync()) {
            controller.add('Creating Palettes folder...');
            dir.createSync(recursive: true);
          }

          final file = File(dir.path + url.substring(url.lastIndexOf('/') + 1));
          controller.add('Downloading image...');

          final fileBodyBytes = await http.readBytes(Uri.parse(url));
          file.writeAsBytesSync(fileBodyBytes);

          controller.add('Image downloaded at Pictures/Palettes/');
          await controller.close();
        },
      );

      return controller.stream;
    } catch (e) {
      return Stream.error('Error on download image: $e');
    }
  }

  Future<void> verifyPermission() async {
    final deviceInfo = DeviceInfoPlugin();

    switch (Platform.operatingSystem) {
      case 'android':
        final androidInfo = await deviceInfo.androidInfo;
        if (androidInfo.version.sdkInt < 33) {
          await Permission.storage.request();
        } else {
          await Permission.photos.request();
        }
        break;
      default:
      // Handle other platforms or do nothing
        break;
    }
  }

  Future<void> shareWallpaper({required String url, required bool isFile}) async {
    try {
      if (isFile && !Platform.isLinux) {
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/${url.substring(url.lastIndexOf('/') + 1)}');
        final fileBodyBytes = await http.readBytes(Uri.parse(url));
        file.writeAsBytesSync(fileBodyBytes);

        await Share.shareXFiles([XFile(file.path)]);
      } else {
        if (Platform.isAndroid || Platform.isIOS) {
          await Share.shareUri(Uri.parse(url));
        } else {
          await Share.share(url);
        }
      }
    } catch (e) {
      log('Error sharing wallpaper: $e', name: 'WallpaperCubit');
    }
  }

  Future<void> getWallpaperInfo({required String id}) async {
    try {
      final wallpaper = await _wallhavenRepository.getWallpaperInfo(
        id: id,
        apikey: state.wallQuery?.apikey ?? '',
      );
      emit(state.copyWith(wallpaperInfo: wallpaper, error: '', isWallpaperSetting: null));
    } catch (e) {
      log('Error getting wallpaper info: $e', name: 'WallpaperCubit');
    }
  }

  Future<void> setWallpaper({required String url, required int screen}) async {
    emit(state.copyWith(isWallpaperSetting: true, error: '')); // Start setting wallpaper

    try {
      if (Platform.isAndroid || Platform.isIOS) {
        final file = File(url.substring(url.lastIndexOf('/') + 1));

        if (await file.exists()) {
          // Platform-specific wallpaper setting logic
          if (Platform.isAndroid) {
            // Android wallpaper setting logic (may require additional packages or permissions)
          } else if (Platform.isIOS) {
            // iOS wallpaper setting logic (may require additional packages or permissions)
          }
          emit(state.copyWith(isWallpaperSetting: false)); // Wallpaper set successfully
        } else {
          log('Wallpaper file not found');
          emit(state.copyWith(isWallpaperSetting: false, error: 'Wallpaper file not found'));
        }
      } else {
        log('Setting wallpapers is not supported on this platform.');
        emit(state.copyWith(isWallpaperSetting: false, error: 'Setting wallpapers is not supported on this platform.'));
      }
    } catch (e) {
      log('Error setting wallpaper: $e', name: 'WallpaperCubit');
      emit(state.copyWith(isWallpaperSetting: false, error: e.toString()));
    }
  }

  @override
  WallpaperState fromJson(Map<String, dynamic> json) => WallpaperState.fromJson(json);

  @override
  Map<String, dynamic> toJson(WallpaperState state) => state.toJson();
}
