import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:Palettes/app/app.dart';
import 'package:Palettes/rive/screens/onboding/components/sign_in_form.dart';
import 'package:Palettes/rive/screens/onboding/onboding_screen.dart';
import 'package:Palettes/settings/screens/help.dart';
import 'package:Palettes/settings/screens/license.dart';
import 'package:Palettes/settings/screens/our%20upcoming%20apps.dart';
import 'package:Palettes/settings/screens/ucpoming%20features.dart';
import 'package:Palettes/wallhaven/wallhaven.dart';

class HavenApp extends StatelessWidget {
  const HavenApp({required this.wallhavenRepository, super.key});

  final WallhavenRepository wallhavenRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: wallhavenRepository,
      child: BlocProvider(
        create: (_) => WallpaperCubit(wallhavenRepository),
        child: const HavenAppView(),
      ),
    );
  }
}

class HavenAppView extends StatelessWidget {
  const HavenAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
          primary: Colors.cyan, // Primary color for the theme
          secondary: Colors.teal, // Secondary color for other UI elements
        ),
        useMaterial3: true,
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'GummyBear',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Adjusted to black for better contrast
          ),
          titleMedium: TextStyle(
            fontFamily: 'GummyBear',
            fontSize: 16,
            color: Colors.grey, // Adjusted to grey for a softer look
          ),
          bodyLarge: TextStyle(
            fontFamily: 'GummyBear',
            fontSize: 14,
            color: Colors.black, // Adjusted to black for better readability
          ),
        ),
        // Additional styling options can be added here
      ),
      home:  OnboardingScreen(),
    );
  }
}
