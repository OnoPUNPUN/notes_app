import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  const NoteTile(
      {super.key,
      required this.text,
      required this.onEditPressed,
      required this.onDeletePressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: ListTile(
        title: Text(text),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: onEditPressed, icon: Icon(Icons.edit)),
            IconButton(onPressed: onDeletePressed, icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
