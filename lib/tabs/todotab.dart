import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fokkkus/components/dialog_box.dart';
import 'package:fokkkus/components/todo_list.dart';
import 'package:fokkkus/services/get_notes.dart';
import 'package:fokkkus/theme/themeprovider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ToDoTab extends StatefulWidget {
  const ToDoTab({super.key});

  @override
  State<ToDoTab> createState() => _ToDoTabState();
}

class _ToDoTabState extends State<ToDoTab> {
  final TextEditingController _controller = TextEditingController();

// save new task
  void saveNewTask() {
    setState(() {
      FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('notes')
          .add({
        'title': _controller.text,
        'content': 'Wo',
        'date': Timestamp.now(),
        'isCompleted': false,
      });

      // db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    // db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
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
            const Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  TodoList(
                      title:
                          "this is a super long text that should not be good in making a todo",
                      content: "Wo"),
                  TodoList(title: "Test", content: "Wo"),
                  TodoList(title: "Test", content: "Wo"),
                  TodoList(title: "Test", content: "Wo"),
                  TodoList(title: "Test", content: "Wo"),
                  TodoList(title: "Test", content: "Wo"),
                  TodoList(title: "Test", content: "Wo"),
                  TodoList(title: "Test", content: "Wo"),
                  TodoList(title: "Test", content: "Wo"),
                  TodoList(title: "Test", content: "Wo"),
                  Column(
                    children: [
                      TodoList(title: "completed", content: "Wo"),
                      TodoList(title: "completed", content: "Wo"),
                      TodoList(title: "completed", content: "Wo"),
                    ],
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: Container(
                width: double.infinity,
                child: FloatingActionButton(
                  elevation: 0,
                  onPressed: () {
                    createNewTask();
                    print("new button");
                  },
                  child: const Text("Add TODO"),
                ),
              ),
            ),
          ]),
        ));
  }
}

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double containerWidth = deviceWidth * 0.9;

    return Container(
      // padding: const EdgeInsets.all(10),
      width: containerWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFFFFFFFF),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          const Icon(
            Icons.add_rounded,
            size: 35,
            color: Color(0xFF745D79),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(onPressed: () {
            print("hi");
          }),
          // const Expanded(
          //   child: TextField(
          //     maxLines: null,
          //     expands: true,
          //     textAlignVertical: TextAlignVertical.center,
          //     decoration: InputDecoration(
          //       hintText: 'Enter text...',
          //       hintStyle: TextStyle(color: Color(0xFFBFAEC4)),
          //       border: InputBorder.none,
          //     ),
          //     style: TextStyle(color: Color(0xFF735D78), fontFamily: 'Poppins'),
          //   ),
          // ),
          // SizedBox(
          //   width: 15,
          // ),
        ],
      ),
    );
  }
}
