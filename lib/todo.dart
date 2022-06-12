import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  List<String> allTodos = [];
  TextEditingController names = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Column(
        children: [
          TextField(
            controller: names,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Add Todo"),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return ListTile(
                  tileColor: Colors.grey,
                  title: Text(allTodos[index]),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
