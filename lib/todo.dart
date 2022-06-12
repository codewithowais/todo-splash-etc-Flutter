import 'package:flutter/material.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  List<String> allTodos = [];
  TextEditingController names = TextEditingController();
  TextEditingController updatenames = TextEditingController();

  addValue() {
    setState(() {
      allTodos.add(names.text);
      names.clear();
    });
  }

  deleteValue(index) {
    setState(() {
      allTodos.removeAt(index);
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
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              bottom: 20,
            ),
            child: ElevatedButton(
              onPressed: () {
                addValue();
              },
              child: const Text("Add Todo"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: allTodos.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  tileColor: Colors.grey,
                  title: Text(allTodos[index]),
                  trailing: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Edit ToDo"),
                                  content: TextField(
                                    controller: updatenames,
                                  ),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          setState(
                                            () {
                                              allTodos.replaceRange(
                                                index,
                                                index + 1,
                                                {updatenames.text},
                                              );
                                              updatenames.clear();
                                            },
                                          );
                                        },
                                        child: const Text("Edit"))
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            deleteValue(index);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
