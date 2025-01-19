import 'package:flutter/material.dart';
import 'package:Palettes/settings/screens/account_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatelessWidget {
  final String instagramUrl = 'https://www.instagram.com/impulze.in';
  final String instagramAssetPath = 'assets/mock/logo.png'; // Replace with your asset path

  void _launchURL() async {
    if (await canLaunch(instagramUrl)) {
      await launch(instagramUrl);
    } else {
      throw 'Could not launch $instagramUrl';
    }
  }

  void _goToAccountPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AccountScreen(name: '',)), // Replace with your AccountPage widget
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: null, // Remove default title
            pinned: true,
            floating: true,
            expandedHeight: 100.0, // Adjust the height as needed
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.white, // Background color
              ),
              titlePadding: EdgeInsets.zero, // Remove default title padding
              title: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16.0), // Adjust padding as needed
                  child: Text(
                    'Help Page',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Adjust text color if needed
                    ),
                  ),
                ),
              ),
              collapseMode: CollapseMode.pin,
            ),
            leading: GestureDetector(
              onTap: () => _goToAccountPage(context), // Navigate to AccountPage
              child: Padding(
                padding: const EdgeInsets.all(8.0), // Adjust padding as needed
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black, // Adjust icon color if needed
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(20.0), // Padding inside the container
                decoration: BoxDecoration(
                  color: Colors.white, // Background color of the container
                  borderRadius: BorderRadius.circular(20.0), // Circular border radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // Shadow offset
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to the Help Page!',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Welcome to our app! As this is a new application, you might encounter some bugs or issues. We appreciate your patience as we work to improve your experience. If you come across any problems or have suggestions, please report them here. Your feedback is invaluable to us and helps us make the app better for everyone. Thank you for your support!',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'For more information, visit our Instagram page:',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: _launchURL,
                      child: Image.asset(
                        instagramAssetPath,
                        width: 100, // Adjust the width as needed
                        height: 100, // Adjust the height as needed
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Add more content here
                  ],
                ),
              ),
            ),
          ),
          // Add more Slivers here if needed
        ],
      ),
    );
  }
}
