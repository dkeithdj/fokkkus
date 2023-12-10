import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fokkkus/models/note.dart';
import 'package:fokkkus/services/authentication.dart';
import 'package:fokkkus/services/get_notes.dart';

class HomePageAuth extends StatefulWidget {
  const HomePageAuth({super.key});

  @override
  State<HomePageAuth> createState() => _HomePageAuthState();
}

class _HomePageAuthState extends State<HomePageAuth> {
  final user = FirebaseAuth.instance.currentUser!;
  final fetchNotes = GetNotes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Authentication().signOut();
            },
          )
        ],
      ),
      body: Column(
        children: [
          const Text('Signed In'),
          Text(user.displayName!),
          ElevatedButton(
              onPressed: () {
                fetchNotes.addNotes("this is a new note", "shish");
              },
              child: Text("clickto add note")),
          // StreamBuilder<QuerySnapshot>(
          //     stream: fetchNotes.getNotes(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasError) {
          //         return Text("Error: ${snapshot.error}");
          //       } else if (snapshot.hasData) {
          //         List notes = snapshot.data!.docs;
          //         return Expanded(
          //           child: ListView.builder(
          //               itemCount: notes.length,
          //               itemBuilder: (context, index) {
          //                 DocumentSnapshot ds = notes[index];
          //                 String docID = ds.id;
          //                 Map<String, dynamic> data =
          //                     ds.data() as Map<String, dynamic>;
          //                 String title = data['title'];
          //
          //                 return ListTile(
          //                     title: Text(title),
          //                     trailing: Row(
          //                         mainAxisSize: MainAxisSize.max,
          //                         children: [
          //                           IconButton(
          //                               onPressed: () {},
          //                               icon: const Icon(Icons.edit)),
          //                           IconButton(
          //                               onPressed: () {},
          //                               icon: const Icon(Icons.delete))
          //                         ]));
          //               }),
          //         );
          //       } else {
          //         return const Center(child: CircularProgressIndicator());
          //       }
          //     })
          // list notes
          //
          // StreamBuilder<List<Note>>(
          //     stream: GetNotes().getNotes(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasError) {
          //         return Text("Error: ${snapshot.error}");
          //       } else if (snapshot.hasData) {
          //         final notes = snapshot.data!;
          //         return ListView(children: notes.map(buildList.toList()));
          //         } else {
          //         return const Center(child: CircularProgressIndicator());
          //       }
          //     })
        ],
      ),
    );
  }
}
