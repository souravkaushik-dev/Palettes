import 'package:flutter/material.dart';
import 'package:Palettes/app/app.dart';
import 'package:Palettes/settings/screens/license.dart';
import 'package:ionicons/ionicons.dart';
import 'package:Palettes/settings/screens/our%20upcoming%20apps.dart';
import 'package:Palettes/settings/screens/ucpoming%20features.dart';
import 'package:Palettes/settings/screens/help.dart';
import 'package:Palettes/settings/widgets/setting_item.dart';

import '../../app/view/home_page.dart';

class AccountScreen extends StatefulWidget {
  final String name;

  const AccountScreen({super.key, required this.name});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
        onPressed: () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false,
      );
    },
          icon: const Icon(Ionicons.chevron_back_outline),
        ),
        leadingWidth: 80,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Settings",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Gummy',
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Welcome To Palettes",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: 'GummyBear',
                ),
              ),
              const SizedBox(height: 10),
              Text("Currently in (Beta) state", // Display the user's name
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontFamily: 'GummyBear',
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/mock/logo.png', // Replace with your image asset
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 40),
              const Text(
                "Parameters",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: 'Gummy',
                ),
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "License",
                icon: Ionicons.earth,
                bgColor: Colors.orange.shade100,
                iconColor: Colors.orange,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Upcoming Apps",
                icon: Ionicons.notifications,
                bgColor: Colors.blue.shade100,
                iconColor: Colors.blue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpcomingAppsPage()),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Upcoming Features",
                icon: Ionicons.moon,
                bgColor: Colors.purple.shade100,
                iconColor: Colors.purple,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpcomingFeaturesPage()),
                  );
                },
              ),
              const SizedBox(height: 20),
              SettingItem(
                title: "Help",
                icon: Ionicons.help_circle,
                bgColor: Colors.red.shade100,
                iconColor: Colors.red,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HelpPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
