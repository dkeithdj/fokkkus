import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fokkkus/components/dialog_box.dart';
import 'package:fokkkus/components/todo_list.dart';
import 'package:fokkkus/models/todo.dart';
import 'package:fokkkus/services/todo_service.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ToDoTab extends StatefulWidget {
  const ToDoTab({super.key});

  @override
  State<ToDoTab> createState() => _ToDoTabState();
}

class _ToDoTabState extends State<ToDoTab> {
  final TextEditingController _controller = TextEditingController();
  final TodoService _todoService = GetIt.I.get<TodoService>();
  bool _isCollapsed = false;

  createNewTask() {
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          formKey: formKey,
          controller: _controller,
          onSave: () {
            if (formKey.currentState!.validate()) {
              _todoService.addTodo(Todo(
                  title: _controller.text,
                  isChecked: false,
                  timestamp: Timestamp.now()));
              _controller.clear();
              Navigator.of(context).pop();
            }
          },
          onCancel: () {
            _controller.clear();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  editTask(String id, String todoText) {
    final formKey = GlobalKey<FormState>();
    _controller.text = todoText;
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          formKey: formKey,
          controller: _controller,
          onSave: () {
            if (formKey.currentState!.validate()) {
              _todoService.editTask(id, _controller.text);
              _controller.clear();
              Navigator.of(context).pop();
            }
          },
          onCancel: () {
            _controller.clear();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Provider.of<ThemeProvider>(context).themeData;
    DateTime currentDate = DateTime.now();
    String dayOfMonth = DateFormat('dd').format(currentDate);
    String monthOfYear = DateFormat('MMM').format(currentDate).toUpperCase();
    String year = DateFormat('yyyy').format(currentDate);
    String dayOfWeek = DateFormat('EEEE').format(currentDate);

    return Container(
        color: themeData.colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              dayOfMonth,
                              style: TextStyle(
                                color: themeData.textTheme.displayMedium?.color,
                                fontSize: 56,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  monthOfYear,
                                  style: TextStyle(
                                    color: themeData
                                        .textTheme.displayMedium?.color,
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  year,
                                  style: TextStyle(
                                    color: themeData
                                        .textTheme.displayMedium?.color,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          dayOfWeek,
                          style: TextStyle(
                            color: themeData.textTheme.displayMedium?.color,
                            fontSize: 20,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // not yet done todos
                      streamTodoList(false),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isCollapsed = !_isCollapsed;
                            });
                          },
                          child: Container(
                            width: 120,
                            height: 20,
                            decoration: ShapeDecoration(
                              color: const Color(0xFFD9D9D9),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _isCollapsed
                                      ? const Icon(Icons.expand_more_rounded)
                                      : const Icon(Icons.expand_less_rounded),
                                  const Text(
                                    'Completed',
                                    style: TextStyle(
                                      color: Color(0xFF825468),
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ),

                      //done todos
                      _isCollapsed ? const SizedBox() : streamTodoList(true),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: Container(
                width: double.infinity,
                child: FloatingActionButton(
                  elevation: 0,
                  onPressed: () {
                    createNewTask();
                  },
                  child: const Text("Add TODO"),
                ),
              ),
            ),
          ]),
        ));
  }

  StreamBuilder<QuerySnapshot<Object?>> streamTodoList(bool isChecked) {
    return StreamBuilder<QuerySnapshot>(
      stream: _todoService.getTodo(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          const Text("Failed to load data");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return Column(
            children: snapshot.data!.docs
                .map((DocumentSnapshot item) {
                  Todo todo = Todo(
                      title: item['title'],
                      isChecked: item['isChecked'],
                      timestamp: item['timestamp']);
                  return TodoList(
                    todo: todo,
                    onComplete: (value) =>
                        _todoService.checkTask(item.id, item['isChecked']),
                    onEdit: () => editTask(item.id, item['title']),
                    onDelete: (context) => _todoService.deleteTodo(item.id),
                  );
                })
                .where((element) => element.todo.isChecked == isChecked)
                .toList(),
          );
        }
        return const Text("wow such empty");
      },
    );
  }
}
