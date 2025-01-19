import 'package:flutter/material.dart';

import 'account_screen.dart';

class UpcomingAppsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(// Background color with opacity
                      padding: EdgeInsets.symmetric(vertical: 70.0),
                      child: Text(
                        'Upcoming Apps',
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
            delegate: SliverChildListDelegate(
              [
                _buildAppNotice(
                  title: 'IMPULZE - Online Music Player',
                  releaseDate: '31st August',
                  description: 'IMPULZE is an online music player that lets you stream your favorite tracks from the cloud. Enjoy high-quality audio and discover new music effortlessly.',
                ),
                _buildAppNotice(
                  title: 'MUZE - Offline Music Player',
                  releaseDate: '20th August',
                  description: 'MUZE is an offline music player designed to offer a seamless listening experience. Store your music locally and enjoy it anytime, anywhere without an internet connection.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppNotice({
    required String title,
    required String releaseDate,
    required String description,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(15.0),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 5.0),
            Text(
              'Releasing on $releaseDate',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 10.0),
            Text(description),
          ],
        ),
      ),
    );
  }
}

