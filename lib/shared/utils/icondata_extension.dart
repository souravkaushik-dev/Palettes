import 'package:flutter/material.dart';

class IconDataSerializer {
  static IconData fromJson(Map<String, dynamic> json) {
    return IconData(
      json['codePoint'] as int,
      fontFamily: json['fontFamily'] as String,
      fontPackage: json['fontPackage'] as String?,
    );
  }

  static Map<String, dynamic> toJson(IconData icon) => {
    'codePoint': icon.codePoint,
    'fontFamily': icon.fontFamily,
    'fontPackage': icon.fontPackage,
  };
}