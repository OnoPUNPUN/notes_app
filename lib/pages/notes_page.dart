import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/models/note_database.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // text controller to access what the user typed
  final TextEditingController textController = TextEditingController();

  // create a note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(controller: textController),
        actions: [
          // create button
          MaterialButton(
            onPressed: () {
              // add to db
              Get.find<NoteDatabase>().addNote(textController.text);

              // pop the box
              Get.back();
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  // read a note

  // update a note

  //delete a note

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNote();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
