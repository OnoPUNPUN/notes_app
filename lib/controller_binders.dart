import 'package:get/get.dart';
import 'package:notes_app/models/note_database.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(NoteDatabase());
  }
}
