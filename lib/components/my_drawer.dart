import 'package:flutter/material.dart';
import 'package:notes_app/components/drawer_tile.dart';
import 'package:get/get.dart';
import 'package:notes_app/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // header
          DrawerHeader(child: Icon(Icons.note)),

          // notes tile
          DrawerTile(
              title: "Notes",
              leading: const Icon(Icons.home),
              onTap: () => Navigator.pop(context)),
          DrawerTile(
              title: "Settings",
              leading: const Icon(Icons.settings),
              onTap: () => Get.to(() => SettingsPage()))
          // settings tile
        ],
      ),
    );
  }
}
