import 'package:booking_app/services/auth.dart';
import 'package:booking_app/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/models/business.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: omit_local_variable_types
    final AuthService _auth = AuthService();
    // ignore: omit_local_variable_types
    final HttpService httpService = HttpService();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Reservation'),
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
        body: FutureBuilder(
          future: httpService.getPosts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Business>> snapshot) {
            if (snapshot.hasData) {
              // ignore: omit_local_variable_types
              final List<Business> business = snapshot.data;
              return ListView(
                children: business
                    .map((Business businesses) => ListTile(
                          title: Text(businesses.name),
                        ))
                    .toList(),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
