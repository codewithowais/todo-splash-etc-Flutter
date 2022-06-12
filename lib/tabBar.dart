import 'package:flutter/material.dart';

class TabBarExample extends StatelessWidget {
  const TabBarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.chat),
              ),
              Tab(
                icon: Icon(Icons.contacts),
              ),
              Tab(
                icon: Icon(Icons.call),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("Its Chat Screen"),
            ),
            Center(
              child: Text("All Contacts here"),
            ),
            Center(
              child: Text("All Call Logs here"),
            ),
          ],
        ),
      ),
    );
  }
}
