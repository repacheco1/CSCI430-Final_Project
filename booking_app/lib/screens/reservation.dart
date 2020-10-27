import 'package:booking_app/services/auth.dart';
import 'package:flutter/material.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: omit_local_variable_types
    final AuthService _auth = AuthService();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Reservation'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: const Icon(Icons.person),
            label: const Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
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
