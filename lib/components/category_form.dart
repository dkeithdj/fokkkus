import 'dart:ui';

import 'package:flutter/material.dart';

import 'custom_button.dart';

class CategoryForm extends StatelessWidget {
  final formKey;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final categoryController;
  final focusTimeController;
  final breakTimeController;

  const CategoryForm({
    super.key,
    required this.formKey,
    required this.onSave,
    required this.onCancel,
    this.categoryController,
    this.focusTimeController,
    this.breakTimeController,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: AlertDialog(
        backgroundColor: Colors.purple[100],
        content: Form(
          key: formKey,
          child: Container(
            height: 300,
            child: Column(
              children: [
                TextFormField(
                  controller: categoryController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Category'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a category';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: focusTimeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Focus Time (minutes)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter focus time';
                    }
                    if (int.parse(value) < 10 || int.parse(value) > 120) {
                      return 'Break time must be between 10 - 120 minutes';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: breakTimeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Break Time (minutes)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter break time';
                    }
                    if (int.parse(value) < 5 || int.parse(value) > 30) {
                      return 'Break time must be between 5 - 30 minutes';
                    }
                    return null;
                  },
                ),
              ],
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
