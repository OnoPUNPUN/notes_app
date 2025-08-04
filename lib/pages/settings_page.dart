import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/theme/theme_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Row(
        children: [
          //dark mode
          Text("Dark Mode"),

          //switch toggle
          Switch(
              value: Get.find<ThemeController>().isDarkMode,
              onChanged: (Value) {
                Get.find<ThemeController>().toggleTheme();
              })
        ],
      ),
    );
  }
}
