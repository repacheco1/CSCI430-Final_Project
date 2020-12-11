import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/services/auth.dart';

class BookingsPage extends StatefulWidget {
  const BookingsPage({Key key}) : super(key: key);

  @override
  _BookingsPageState createState() => _BookingsPageState();
}

class _BookingsPageState extends State<BookingsPage> {
    final AuthService _auth = AuthService();
    String uid = '';
    @override
    void initState() {
      super.initState();
      uid = _auth.theUser().toString();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Bookings'),
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
      body: StreamBuilder(
        // ignore: unnecessary_string_interpolations
        stream: FirebaseFirestore.instance.collection('reservation').where('Uid', isEqualTo: '$uid').snapshots(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data.docs.map((doc) {
              return Card(
                child: ListTile(
                  title: Text('${doc.get('name')}'),
                  subtitle: Text('Date: ${doc.get('date')} Time: ${doc.get('time')}'),
                  trailing: const Icon(
                    Icons.fastfood, 
                    color: Colors.orange
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
