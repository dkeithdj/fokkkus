import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fokkkus/components/dialog_box.dart';
import 'package:fokkkus/components/todo_list.dart';
import 'package:fokkkus/models/todo.dart';
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
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('notes')
          .add(Todo(
                  title: _controller.text,
                  isChecked: false,
                  timestamp: Timestamp.now())
              .toFirestore())
          .then((value) => print(value))
          .onError((error, _) => print(error));
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

  updateTask(String id, Todo? todo) {
    FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notes')
        .doc(id)
        .update({'isChecked': !todo!.isChecked!}).then(
            (value) => print("updated"),
            onError: (e) => print("failed to update todo"));
  }

  void deleteTodo(String id) {
    FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notes')
        .doc(id)
        .delete()
        .then((value) => print("yay"),
            onError: (e) => print("failed to delete todo"));
  }

  final Stream<QuerySnapshot> _todoStream = FirebaseFirestore.instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('notes')
      // .where('isChecked', isEqualTo: false)
      // .orderBy('timestamp', descending: true)
      .snapshots();

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
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _todoStream,
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        const Text("Failed to load data");
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData) {
                        return Column(
                          children:
                              snapshot.data!.docs.map((DocumentSnapshot item) {
                            Todo todo = Todo(
                                title: item['title'],
                                isChecked: item['isChecked'],
                                timestamp: item['timestamp']);
                            return TodoList(
                              todo: todo,
                              onComplete: (value) => updateTask(item.id, todo),
                              // onEdit: updateTask(item.id, todo),
                              onDelete: (context) => deleteTodo(item.id),
                            );
                          }).toList(),
                        );
                      }
                      return const Text("wow such empty");
                    },
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
}
