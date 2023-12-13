import 'package:flutter/material.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:provider/provider.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
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
                      print("hio");
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
}
