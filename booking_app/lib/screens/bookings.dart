import 'package:flutter/material.dart';

class BookingsPage extends StatelessWidget {
  const BookingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bookings'),
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