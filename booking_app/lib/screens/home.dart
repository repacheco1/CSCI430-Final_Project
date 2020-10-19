import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: const Text('Lorem Ipsum'),
          subtitle: Text('$index'),
        );
      }),
    );
  }
} 