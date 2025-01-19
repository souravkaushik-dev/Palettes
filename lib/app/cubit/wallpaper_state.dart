import 'package:Palettes/app/models/home_search_title_model.dart';
import 'package:Palettes/shared/models/wallpaper_info.dart';
import 'package:Palettes/shared/models/wallpaper_list.dart';
import 'package:Palettes/shared/models/wallpaper_query.dart';
import 'package:equatable/equatable.dart';


enum HomeStatus { initial, loading, success, failure }
enum UserStatus { initial, loading, success, failure }

extension HomeStatusX on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;
  bool get isLoading => this == HomeStatus.loading;
  bool get isSuccess => this == HomeStatus.success;
  bool get isFailure => this == HomeStatus.failure;
}

class WallpaperState extends Equatable {
  const WallpaperState({
    this.homeStatus = HomeStatus.initial,
    this.userStatus = UserStatus.initial,
    this.wallpaperList = WallpaperList.empty,
    this.colorsData = const {},
    this.wallQuery = const WallpaperQuery(),
    this.homeSearchTitleModel = const HomeSearchTitleModel.toplist(),
    this.wallpaperInfo,
    this.isWallpaperSetting = false,
    this.error,
  });

  final HomeStatus homeStatus;
  final UserStatus userStatus;
  final WallpaperList wallpaperList;
  final Map<String, int> colorsData;
  final WallpaperQuery wallQuery;
  final HomeSearchTitleModel homeSearchTitleModel;
  final WallpaperInfo? wallpaperInfo;
  final bool isWallpaperSetting;
  final String? error;

  WallpaperState copyWith({
    HomeStatus? homeStatus,
    UserStatus? userStatus,
    WallpaperList? wallpaperList,
    Map<String, int>? colorsData,
    WallpaperQuery? wallQuery,
    HomeSearchTitleModel? homeSearchTitleModel,
    WallpaperInfo? wallpaperInfo,
    bool? isWallpaperSetting,
    String? error,
  }) {
    return WallpaperState(
      homeStatus: homeStatus ?? this.homeStatus,
      userStatus: userStatus ?? this.userStatus,
      wallpaperList: wallpaperList ?? this.wallpaperList,
      colorsData: colorsData ?? this.colorsData,
      wallQuery: wallQuery ?? this.wallQuery,
      homeSearchTitleModel: homeSearchTitleModel ?? this.homeSearchTitleModel,
      wallpaperInfo: wallpaperInfo ?? this.wallpaperInfo,
      isWallpaperSetting: isWallpaperSetting ?? this.isWallpaperSetting,
      error: error ?? this.error,
    );
  }

  factory WallpaperState.fromJson(Map<String, dynamic> json) {
    return WallpaperState(
      homeStatus: json['homeStatus'] == null
          ? HomeStatus.initial
          : HomeStatus.values[json['homeStatus'] as int],
      userStatus: json['userStatus'] == null
          ? UserStatus.initial
          : UserStatus.values[json['userStatus'] as int],
      wallpaperList: json['wallpaperList'] == null
          ? WallpaperList.empty
          : WallpaperList.fromJson(
        json['wallpaperList'] as Map<String, dynamic>,
      ),
      colorsData: json['colorsData'] == null
          ? {}
          : Map<String, int>.from(json['colorsData'] as Map<String, dynamic>),
      wallQuery: json['wallQuery'] == null
          ? const WallpaperQuery()
          : WallpaperQuery.fromJson(
        json['wallQuery'] as Map<String, dynamic>,
      ),
      homeSearchTitleModel: json['homeSearchTitleModel'] == null
          ? const HomeSearchTitleModel.toplist()
          : HomeSearchTitleModel.fromJson(
        json['homeSearchTitleModel'] as Map<String, dynamic>,
      ),
      wallpaperInfo: json['wallpaperInfo'] == null
          ? null
          : WallpaperInfo.fromJson(
        json['wallpaperInfo'] as Map<String, dynamic>,
      ),
        isWallpaperSetting: json['isWallpaperSetting'] is bool ? json['isWallpaperSetting'] as bool : false,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'homeStatus': homeStatus.index,
      'userStatus': userStatus.index,
      'wallpaperList': wallpaperList.toJson(),
      'colorsData': colorsData,
      'wallQuery': wallQuery.toJson(),
      'homeSearchTitleModel': homeSearchTitleModel.toJson(),
      'wallpaperInfo': wallpaperInfo?.toJson(),
      'isWallpaperSetting': isWallpaperSetting,
      'error': error,
    };
  }

  @override
  List<Object?> get props => [
    homeStatus,
    userStatus,
    wallpaperList,
    colorsData,
    wallQuery,
    homeSearchTitleModel,
    wallpaperInfo,
    isWallpaperSetting,
    error,
  ];
}
