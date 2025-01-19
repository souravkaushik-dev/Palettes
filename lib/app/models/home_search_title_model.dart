import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:Palettes/shared/utils/color_extension.dart';
import 'package:Palettes/shared/utils/icondata_extension.dart';

class HomeSearchTitleModel extends Equatable {
  const HomeSearchTitleModel({
    required this.icon,
    required this.iconColor,
    required this.searchTitle,
  });

  factory HomeSearchTitleModel.fromJson(Map<String, dynamic> json) {
    return HomeSearchTitleModel(
      icon: _iconMap[json['iconName']]!,
      iconColor: Color(int.parse(json['iconColor'] as String)),
      searchTitle: json['searchTitle'] as String,
    );
  }

  const HomeSearchTitleModel.toplist()
      : icon = Icons.diamond_outlined,
        iconColor = Colors.purple,
        searchTitle = 'Best of the month';

  const HomeSearchTitleModel.latest()
      : icon = Icons.schedule_outlined,
        iconColor = Colors.green,
        searchTitle = 'Latest';

  const HomeSearchTitleModel.hot()
      : icon = Icons.local_fire_department_outlined,
        iconColor = Colors.red,
        searchTitle = 'Hot';

  const HomeSearchTitleModel.random()
      : icon = Icons.shuffle_outlined,
        iconColor = Colors.orange,
        searchTitle = 'Random';

  const HomeSearchTitleModel.search(String query)
      : icon = Icons.search,
        iconColor = Colors.grey,
        searchTitle = query;

  final IconData icon;
  final Color iconColor;
  final String searchTitle;

  static const Map<String, IconData> _iconMap = {
    'diamond_outlined': Icons.diamond_outlined,
    'schedule_outlined': Icons.schedule_outlined,
    'local_fire_department_outlined': Icons.local_fire_department_outlined,
    'shuffle_outlined': Icons.shuffle_outlined,
    'search': Icons.search,
  };

  static const Map<String, String> _reverseIconMap = {
    'diamond_outlined': 'diamond_outlined',
    'schedule_outlined': 'schedule_outlined',
    'local_fire_department_outlined': 'local_fire_department_outlined',
    'shuffle_outlined': 'shuffle_outlined',
    'search': 'search',
  };

  Map<String, dynamic> toJson() => {
    'iconName': _reverseIconMap[_getIconName(icon)]!,
    'iconColor': iconColor.toHex(),
    'searchTitle': searchTitle,
  };

  static String _getIconName(IconData icon) {
    return _reverseIconMap.entries.firstWhere((entry) => _iconMap[entry.value] == icon).key;
  }

  @override
  List<Object?> get props => [
    icon,
    iconColor,
    searchTitle,
  ];

  @override
  String toString() {
    return 'HomeSearchTitleModel(icon: $icon, iconColor: $iconColor, searchTitle: $searchTitle)';
  }
}
