import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fokkkus/models/todo.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  final Todo todo;
  final Function(bool?)? onComplete;
  final Function()? onEdit;
  final Function(BuildContext)? onDelete;

  const TodoList(
      {super.key,
      required this.todo,
      this.onComplete,
      this.onEdit,
      this.onDelete});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Provider.of<ThemeProvider>(context).themeData;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Color(0xFF9A687F);
      }
      return Color(0xFF9A687F);
    }

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
              leading: Checkbox(
                checkColor: Colors.white,
                shape: const CircleBorder(),
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: todo.isChecked,
                onChanged: onComplete,
              ),
              onTap: onEdit,
              title: Text(
                todo.title,
                style: TextStyle(
                    color: todo.isChecked!
                        ? Colors.grey.withOpacity(0.7)
                        : Colors.black,
                    decoration: todo.isChecked!
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            )),
      ),
    );
  }
}
