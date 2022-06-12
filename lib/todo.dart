import 'package:flutter/material.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  List<String> allTodos = [];
  TextEditingController names = TextEditingController();

  addValue() {
    setState(() {
      allTodos.add(names.text);
      names.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextField(
              controller: names,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addValue();
            },
            child: const Text("Add Todo"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: allTodos.length,
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
