import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ListOfQuizzes extends StatelessWidget {
  const ListOfQuizzes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('quizName').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final quizList = snapshot.data!.docs;
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: quizList.length,
                itemBuilder: (BuildContext context, int index) {
                  final quiz = quizList[index].data();

                  return ListTile();
                },
              );
            } else {
              return const Text("no quizes");
            }
          }),
    );
  }
}
 