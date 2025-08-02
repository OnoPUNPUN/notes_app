import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends GetxController {
  static late Isar isar;

  // I N I T I A L I Z E - D A T A B A S E
  static Future<void> initialize() async {
    final dir = await getApplicationCacheDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  // list of notes
  final List<Note> currentNote = [];

  // C R E A T E -- a note to database
  Future<void> addNote(String text) async {
    // create a new note object
    final newNote = Note()..text = text;

    // save to db
    await isar.writeTxn(() => isar.notes.put(newNote));

    // re-read from db
  }

  // R E A D -- notes from db
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNote.clear();
    currentNote.addAll(fetchedNotes);
    update();
  }

  // U P D A T E -- a note in db
  Future<void> updateNote(int id, String newTask) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newTask;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  // D E L E T E -- a note from th db
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
