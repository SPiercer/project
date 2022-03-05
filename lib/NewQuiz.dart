import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewQuiz extends StatefulWidget {
  const NewQuiz({Key? key}) : super(key: key);

  @override
  State<NewQuiz> createState() => _NewQuizState();
}

class _NewQuizState extends State<NewQuiz> {
  final myController = TextEditingController();

 final instance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new quiz"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Question',
              ),
            ),
          ),
          Row(children: <Widget>[
            IconButton(
              icon: const Icon(Icons.check),
              iconSize: 50,
              color: Colors.green,
              tooltip: 'Set answer to true',
              onPressed: () {
                instance
                    .collection('quizzes')
                    .doc()
                    .set({'Questions': myController.text, 'Answers': true});
              },
            ),
            IconButton(
                icon: const Icon(Icons.close),
                iconSize: 50,
                color: Colors.red,
                tooltip: 'Set answer to false',
                onPressed: () {
                  instance
                      .collection('quizName')
                      .doc()
                      .set({'Questions': myController.text, 'Answers': true});
                })
          ])
        ]),
      ),
    );
  }
}
