import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fokkkus/components/category_form.dart';
import 'package:fokkkus/components/category_list.dart';
import 'package:fokkkus/models/category.dart';
import 'package:fokkkus/services/category_service.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class CategorySheet extends StatefulWidget {
  const CategorySheet({super.key});

  @override
  State<CategorySheet> createState() => _CategorySheetState();
}

class _CategorySheetState extends State<CategorySheet> {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _focusTimeController = TextEditingController();
  final TextEditingController _breakTimeController = TextEditingController();
  final CategoryService _categoryService = GetIt.I.get<CategoryService>();
  createCategory() {
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (context) {
        return CategoryForm(
          formKey: formKey,
          categoryController: _categoryController,
          focusTimeController: _focusTimeController,
          breakTimeController: _breakTimeController,
          onSave: () {
            if (formKey.currentState!.validate()) {
              String category = _categoryController.text.toLowerCase();
              String focusTime = _focusTimeController.text;
              String breakTime = _breakTimeController.text;
              _categoryService.addCategory(Category(
                  category: category,
                  focusTime: focusTime,
                  breakTime: breakTime));
              _categoryController.clear();
              _focusTimeController.clear();
              _breakTimeController.clear();
              Navigator.of(context).pop();
            }
          },
          onCancel: () {
            _categoryController.clear();
            _focusTimeController.clear();
            _breakTimeController.clear();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _categoryController.dispose();
    _focusTimeController.dispose();
    _breakTimeController.dispose();
    super.dispose();
  }

  editCategory(String id, Category category) {
    final formKey = GlobalKey<FormState>();
    _categoryController.text = category.category;
    _focusTimeController.text = category.focusTime;
    _breakTimeController.text = category.breakTime;
    showDialog(
        context: context,
        builder: (context) {
          return CategoryForm(
              formKey: formKey,
              categoryController: _categoryController,
              focusTimeController: _focusTimeController,
              breakTimeController: _breakTimeController,
              onSave: () {
                if (formKey.currentState!.validate()) {
                  String category = _categoryController.text;
                  String focusTime = _focusTimeController.text;
                  String breakTime = _breakTimeController.text;
                  _categoryService.editCategory(
                      id,
                      Category(
                          category: category,
                          focusTime: focusTime,
                          breakTime: breakTime));
                  _categoryController.clear();
                  _focusTimeController.clear();
                  _breakTimeController.clear();
                  Navigator.of(context).pop();
                }
              },
              onCancel: () {
                _categoryController.clear();
                _focusTimeController.clear();
                _breakTimeController.clear();
                Navigator.of(context).pop();
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Provider.of<ThemeProvider>(context).themeData;
    Widget buildBottomSheetContent() {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          height: 300,
          child: Column(
            children: [
              const SizedBox(height: 5),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      createCategory();
                      // Insert function for add button here
                    },
                    child: const SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(Icons.add_circle_rounded,
                          size: 30, color: Color(0xFF745D79)),
                    ),
                  ),
                  const Spacer(), // Add some spacing between widgets
                  Text(
                    textAlign: TextAlign.center,
                    'FOCUS CATEGORIES',
                    style: TextStyle(
                      color: themeData.textTheme.titleLarge?.color ??
                          const Color(0xFF2E232F),
                      fontSize: 13,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: Icon(Icons.close,
                          size: 30,
                          color: Provider.of<ThemeProvider>(context)
                              .themeData
                              .iconTheme
                              .color),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        streamCategoryList(),
                      ],
                    )),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              builder: (BuildContext context) {
                return buildBottomSheetContent();
              },
            );
          },
          child: SizedBox(
            width: 30,
            height: 30,
            child: Icon(Icons.add_box_rounded,
                size: 30,
                color: Provider.of<ThemeProvider>(context)
                    .themeData
                    .iconTheme
                    .color),
          ),
        ),
      ],
    );
  }

  StreamBuilder<QuerySnapshot<Object?>> streamCategoryList() {
    return StreamBuilder<QuerySnapshot>(
      stream: _categoryService.getCategories(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          const Text("Failed to load data");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return Column(
            children: snapshot.data!.docs.map((DocumentSnapshot item) {
              Category category = Category(
                  category: item.id,
                  focusTime: item['focusTime'],
                  breakTime: item['breakTime']);
              return CategoryList(
                category: category,
                onEdit: () => editCategory(category.category, category),
                onDelete: (context) => _categoryService.deleteCategory(item.id),
              );
            }).toList(),
          );
        }
        return const Text("wow such empty");
      },
    );
  }
}
