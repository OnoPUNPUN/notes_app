import 'package:flutter/material.dart';

class NotesSettings extends StatelessWidget {
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  const NotesSettings(
      {super.key, required this.onEditPressed, required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //edit
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            onEditPressed!();
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: Text(
                'Edit',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
          ),
        ),

        // delete
        GestureDetector(
          onTap: () {
            onDeletePressed!();
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: Text('Delete',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary)),
            ),
          ),
        ),
      ],
    );
  }
}
