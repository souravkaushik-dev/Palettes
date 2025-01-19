import 'package:flutter/material.dart';
import 'package:Palettes/rive/screens/entryPoint/components/rive_utils.dart';
import 'package:rive/rive.dart';
import '../../../model/menu.dart';
import 'info_card.dart';
import 'side_menu.dart';

class SideBar extends StatefulWidget {
  final String name;

  const SideBar({super.key, required this.name});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Menu selectedSideMenu = sidebarMenus.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 288,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF17203A),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(
                name: widget.name,
                bio: "New user",
                textStyle: const TextStyle(
                  fontFamily: 'Poppins', // Using GummyBear font family
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Browse".toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ),
              ...sidebarMenus.map((menu) => SideMenu(
                menu: menu,
                selectedMenu: selectedSideMenu,
                press: () {
                  RiveUtils.changeSMIBoolState(menu.rive.status);
                  setState(() {
                    selectedSideMenu = menu;
                  });
                  menu.onTap(context); // Execute the menu's onTap logic
                },
                riveOnInit: (artboard) {
                  menu.rive.status = RiveUtils.getRiveInput(artboard,
                      stateMachineName: menu.rive.stateMachineName) as SMIBool?;
                },
              )).toList(),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 40, bottom: 16),
                child: Text(
                  "History".toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white70,
                  ),
                ),
              ),
              ...sidebarMenus2.map((menu) => SideMenu(
                menu: menu,
                selectedMenu: selectedSideMenu,
                press: () {
                  RiveUtils.changeSMIBoolState(menu.rive.status);
                  setState(() {
                    selectedSideMenu = menu;
                  });
                  menu.onTap(context); // Execute the menu's onTap logic
                },
                riveOnInit: (artboard) {
                  menu.rive.status = RiveUtils.getRiveInput(artboard,
                      stateMachineName: menu.rive.stateMachineName) as SMIBool?;
                },
              )).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
