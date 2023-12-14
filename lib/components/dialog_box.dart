import 'dart:ui';

import 'package:flutter/material.dart';

import 'custom_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final formKey;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.formKey,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: AlertDialog(
        backgroundColor: Colors.purple[300],
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter some text";
              }
              return null;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new task",
            ),
          ),
        ),
        actions: [
          CustomButton(text: 'Cancel', onPressed: onCancel),
          CustomButton(text: 'Ok', onPressed: onSave),
        ],
      ),
    );
  }
}
