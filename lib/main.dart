import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Palettes/bootstrap.dart';
import 'package:Palettes/haven_app.dart';
import 'package:Palettes/wallhaven/wallhaven.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter bindings are initialized

  // Set the system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
  ));

  // Run the app
  await bootstrap(() => HavenApp(wallhavenRepository: WallhavenRepository()));
}
