import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Palettes/app/app.dart';
import 'package:Palettes/settings/screens/help.dart';
import 'package:Palettes/settings/screens/license.dart';
import 'package:Palettes/settings/screens/our%20upcoming%20apps.dart';
import 'package:Palettes/settings/screens/ucpoming%20features.dart';

import '../../settings/screens/account_screen.dart';
import 'rive_model.dart';

class Menu {
  final String title;
  final RiveModel rive;
  final Function(BuildContext) onTap; // Update the onTap callback type

  Menu({
    required this.title,
    required this.rive,
    required this.onTap, // Update constructor to include onTap
  });
}

List<Menu> sidebarMenus = [
  Menu(
    title: "Home",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_interactivity"),
    onTap: (context) {
      // Navigate to AccountScreen when Search menu is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    },
  ),
//  Menu(
//    title: "Search",
 //   rive: RiveModel(
  //      src: "assets/RiveAssets/icons.riv",
  //      artboard: "SEARCH",
  //      stateMachineName: "SEARCH_Interactivity"),
//    onTap: (context) {
   //   // Navigate to AccountScreen when Search menu is tapped
   //   Navigator.push(
   //     context,
  //      MaterialPageRoute(builder: (context) => Search(name: '',)),
  //    );
//    },
 // ),
  Menu(
    title: "Upcoming Apps",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "LIKE/STAR",
        stateMachineName: "STAR_Interactivity"),
    onTap: (context) {
      // Navigate to AccountScreen when Search menu is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UpcomingAppsPage()),
      );
    },
  ),
  Menu(
    title: "Help",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
    onTap: (context) {
      // Navigate to AccountScreen when Search menu is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HelpPage()),
      );
    },
  ),
];

List<Menu> sidebarMenus2 = [
  Menu(
    title: "Terms and Conditions",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity"),
    onTap: (context) {
      // Navigate to AccountScreen when Search menu is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),
      );
    },
  ),
  Menu(
    title: "Upcoming Changes",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "BELL",
        stateMachineName: "BELL_Interactivity"),
    onTap: (context) {
      // Navigate to AccountScreen when Search menu is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UpcomingFeaturesPage()),
      );
    },
  ),
];

List<Menu> bottomNavItems = [
  Menu(
    title: "Chat",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
    onTap: (context) {
      // Handle Chat menu tap
      print("Chat menu tapped");
    },
  ),
  Menu(
    title: "Account Screen",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity"),
    onTap: (context) {
      // Navigate to AccountScreen when Search menu is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AccountScreen(name: '',)),
      );
    },
  ),
  Menu(
    title: "Timer",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity"),
    onTap: (context) {
      // Handle Timer menu tap
      print("Timer menu tapped");
    },
  ),
  Menu(
    title: "Notification",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "BELL",
        stateMachineName: "BELL_Interactivity"),
    onTap: (context) {
      // Handle Notification menu tap
      print("Notification menu tapped");
    },
  ),
  Menu(
    title: "Profile",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "USER",
        stateMachineName: "USER_Interactivity"),
    onTap: (context) {
      // Handle Profile menu tap
      print("Profile menu tapped");
    },
  ),
];
