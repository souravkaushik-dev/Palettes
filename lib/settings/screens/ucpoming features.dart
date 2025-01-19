import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'account_screen.dart';

class UpcomingFeaturesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(// Background color with opacity
                      padding: EdgeInsets.symmetric(vertical: 70.0),
                      child: Text(
                        'Upcoming Features',
                        style: TextStyle(
                          fontFamily: 'GummyBear',
                          fontSize: 30.0,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            pinned: true,
            floating: false,
            snap: false,
            backgroundColor: Colors.transparent,
            elevation: 5,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.grey),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccountScreen(name: ''),
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                final features = [
                  Feature(
                    title: 'Edit Your Name',
                    description: 'Change your name directly from the settings page.',
                    icon: Ionicons.create_outline,
                  ),
                  Feature(
                    title: 'Dark Mode',
                    description: 'Switch between light and dark modes for a better experience.',
                    icon: Ionicons.moon_outline,
                  ),
                  Feature(
                    title: 'Animated Navigation Bar',
                    description: 'Enjoy smooth transitions and animations on the navigation bar.',
                    icon: Ionicons.apps_outline,
                  ),
                  Feature(
                    title: 'Direct Apply on Home Screen and Lock Screen',
                    description: 'See changes immediately on your home screen and lock screen.',
                    icon: Ionicons.arrow_forward_outline,
                  ),
                ];

                final feature = features[index];
                return FeatureCard(
                  title: feature.title,
                  description: feature.description,
                  icon: feature.icon,
                );
              },
              childCount: 4, // Number of features
            ),
          ),
        ],
      ),
    );
  }
}

class Feature {
  final String title;
  final String description;
  final IconData icon;

  Feature({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class FeatureCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  FeatureCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.grey),
        title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
        subtitle: Text(description, style: TextStyle(color: Colors.grey)),
        contentPadding: EdgeInsets.all(16),
      ),
    );
  }
}
