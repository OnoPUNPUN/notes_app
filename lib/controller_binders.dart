import 'package:get/get.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:notes_app/theme/theme_controller.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(NoteDatabase());
    Get.put(ThemeController());
  }
}
