import 'package:flutter/material.dart';
import 'package:fokkkus/models/note.dart';

Widget noteList(Function? onTap, Note note) {
  return ListTile(
    onTap: () {
      onTap!();
    },
    title: Text(note.title),
    subtitle: Text(note.content),
  );
}
