import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fokkkus/components/dialog_box.dart';
import 'package:fokkkus/components/todo_list.dart';
import 'package:fokkkus/models/todo.dart';
import 'package:fokkkus/services/firebase_service.dart';
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
  final FirebaseService _firebaseService = GetIt.I.get<FirebaseService>();
  bool _isCollapsed = false;

  // Future<Todo> _todo;
  // FirebaseService _firebaseService = GetIt.I.get<FirebaseService>();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _todo = _getDataFromBackend();
  // }

  // Future<Todo> _getDataFromBackend() async {
  //   DocumentSnapshot<Map<String, dynamic>> snapshot =
  //       await _firebaseService.getTodo();
  //   return Todo.fromFirestore(snapshot, null);
  // }

  createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: () {
            _firebaseService.addTodo(Todo(
                title: _controller.text,
                isChecked: false,
                timestamp: Timestamp.now()));
            _controller.clear();
            Navigator.of(context).pop();
          },
          onCancel: () {
            _controller.clear();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  checkTask(String id, bool isChecked) {
    FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notes')
        .doc(id)
        .update({'isChecked': !isChecked}).then((value) => print("updated"),
            onError: (e) => print("failed to update todo"));
  }

  editTask(String id, String todoText) {
    _controller.text = todoText;
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: () {
            setState(() {
              FirebaseFirestore.instance
                  .collection('user')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('notes')
                  .doc(id)
                  .update({'title': _controller.text}).then(
                      (value) => print("updated"),
                      onError: (e) => print("failed to update todo"));
              _controller.clear();
            });
            Navigator.of(context).pop();
          },
          onCancel: () {
            _controller.clear();
            Navigator.of(context).pop();
          },
        );
      },
    );
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

  Stream<QuerySnapshot> fetchTodo() {
    return FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notes')
        .snapshots();
    // .where('isChecked', isEqualTo: isChecked)
    // .orderBy('timestamp', descending: true)
  }

  @override
  Widget build(BuildContext context) {
    final docRef = FirebaseFirestore.instance
        .collection("user")
        .withConverter(
          fromFirestore: Todo.fromFirestore,
          toFirestore: (Todo city, options) => city.toFirestore(),
        )
        .doc("LA");
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
                                      ? const Icon(Icons.expand_less_rounded)
                                      : const Icon(Icons.expand_more_rounded),
                                  const Text(
                                    'Completed',
                                    style: TextStyle(
                                      color: Color(0xFF825468),
                                      fontSize: 10,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  const Text(
                                    'N',
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
                      !_isCollapsed ? SizedBox() : streamTodoList(true),
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
      stream: fetchTodo(),
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
                        checkTask(item.id, item['isChecked']),
                    onEdit: () => editTask(item.id, item['title']),
                    onDelete: (context) => deleteTodo(item.id),
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
