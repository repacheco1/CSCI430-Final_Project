import 'package:booking_app/services/auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: omit_local_variable_types
    final AuthService _auth = AuthService();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: const Icon(Icons.person),
            label: const Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget> [
              Image.asset('assets/images/logo.png', height: 400, width: 400),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Reserve your favorite seat at your favorite Restaurant here!', 
                            style: TextStyle(fontSize: 20), 
                            textAlign: TextAlign.center
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
