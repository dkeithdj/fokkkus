import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fokkkus/models/category.dart';
import 'package:fokkkus/models/todo.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:fokkkus/timertab_components/event/provider.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  final Category category;
  final Function()? onEdit;
  final Function(BuildContext)? onDelete;

  const CategoryList(
      {super.key, required this.category, this.onEdit, this.onDelete});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Provider.of<ThemeProvider>(context).themeData;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              autoClose: true,
              onPressed: onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.purple[100]),
            child: ListTile(
              onLongPress: onEdit,
              onTap: () {
                SliderValuesProvider sliderValuesProvider =
                    Provider.of<SliderValuesProvider>(context, listen: false);
                sliderValuesProvider
                    .updateFocusDuration(int.parse(category.focusTime));
                sliderValuesProvider
                    .updateBreakDuration(int.parse(category.breakTime));
                Navigator.pop(context);
              },
              title: Text(
                category.category[0].toUpperCase() +
                    category.category.substring(1),
                // category.category.toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            )),
      ),
    );
  }
}
