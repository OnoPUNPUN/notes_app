import 'package:flutter/material.dart';
import 'package:notes_app/controller_binders.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:notes_app/pages/notes_page.dart';
import 'package:get/get.dart';
import 'package:notes_app/theme/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(GetMaterialApp(home: MyApp(), initialBinding: ControllerBinders()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
      theme: Get.find<ThemeController>().themeData,
    );
  }
}
