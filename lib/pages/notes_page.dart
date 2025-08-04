import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/components/my_drawer.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/note_database.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // Get the NoteDatabase controller
  final NoteDatabase noteDatabase = Get.find<NoteDatabase>();
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readNotes();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  // Create a new note
  void createNote() {
    textController.clear();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Note'),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: 'Enter your note'),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () {
              if (textController.text.trim().isNotEmpty) {
                noteDatabase.addNote(textController.text.trim());
                textController.clear();
                Get.back();
              } else {
                Get.snackbar('Error', 'Note cannot be empty');
              }
            },
            child: const Text(
              'Create',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  // Read all notes
  void readNotes() {
    noteDatabase.fetchNotes();
  }

  // Update an existing note
  void updateNote(Note note) {
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Note'),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: 'Update your note'),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (textController.text.trim().isNotEmpty) {
                noteDatabase.updateNote(note.id, textController.text.trim());
                textController.clear();
                Get.back();
              } else {
                Get.snackbar('Error', 'Note cannot be empty');
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  // Delete a note
  void deleteNote(int id) {
    noteDatabase.deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: Colors.black),
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Keep the Notes title as requested
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Notes',
              style: GoogleFonts.dmSerifText(
                fontSize: 48,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          // Notes list
          Expanded(
            child: GetBuilder<NoteDatabase>(
              builder: (controller) {
                final currentNotes = controller.currentNote;

                if (currentNotes.isEmpty) {
                  return const Center(
                    child: Text(
                      "It's Quiet Here 👾👾",
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: currentNotes.length,
                  itemBuilder: (context, index) {
                    final note = currentNotes[index];
                    return Card(
                      elevation: 0,
                      child: ListTile(
                        title: Text(
                          note.text,
                          style: const TextStyle(fontSize: 16),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () => updateNote(note),
                              icon: const Icon(Icons.edit),
                              tooltip: 'Edit Note',
                            ),
                            IconButton(
                              onPressed: () => deleteNote(note.id),
                              icon: const Icon(Icons.delete),
                              tooltip: 'Delete Note',
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
