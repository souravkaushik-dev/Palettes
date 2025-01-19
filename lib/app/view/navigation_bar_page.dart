import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:Palettes/settings/screens/account_screen.dart';
import '../../constants.dart';
import 'home_page.dart';
import 'save_page.dart';
import 'user_page.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const SavePage(),
    const AccountScreen(name: '',)// Using const for SettingsPage
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RealWhite,
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: RealWhite.withOpacity(.1),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Mint,
              hoverColor: Mint,
              gap: 8,
              activeColor: Land,
              iconSize: 22,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 500),
              tabBackgroundColor: Mint,
              color: Hover,
              tabs: [
                GButton(
                  icon: Iconsax.home_2,
                  text: 'Home',
                ),
                GButton(
                  icon: Iconsax.image,
                  text: 'Save',
                ),
                GButton(
                  icon: Iconsax.crown,
                  text: 'Settings',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
