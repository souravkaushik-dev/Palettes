import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'menu.dart'; // Adjust the import based on your project

// Widget to render each Menu item
class MenuWidget extends StatelessWidget {
  final Menu menu;

  const MenuWidget({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        menu.onTap(context); // Execute the menu's onTap logic
        if (menu.title == "Home") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LicensePage()),
          );
        }
        // Add more navigation or action logic based on the menu title if needed
      },
      child: ListTile(
        leading: SizedBox(
          height: 40,
          width: 40,
          child: RiveAnimation.asset(
            menu.rive.src,
            artboard: menu.rive.artboard,
            stateMachines: [menu.rive.stateMachineName],
            onInit: (artboard) {
              // You can initialize the artboard or set its properties here
            },
          ),
        ),
        title: Text(menu.title),
        // Add any additional styling or widgets here
      ),
    );
  }
}

// Widget to display all menus
class AllMenusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Combine all menus into one list
    final allMenus = [
      ...sidebarMenus,
      ...sidebarMenus2,
      ...bottomNavItems,
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Menus')),
      body: ListView(
        children: allMenus.map((menu) => MenuWidget(menu: menu)).toList(),
      ),
    );
  }
}
