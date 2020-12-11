import 'package:booking_app/screens/business_detail.dart';
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
        body: Center(
          child: FutureBuilder<List<Business>>(
              future: httpService.getPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading:  CircleAvatar(
                                      radius: 30.0,
                                      backgroundImage: NetworkImage(snapshot.data[index].imageUrl),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    // ignore: unnecessary_string_interpolations
                                    title: Text('${snapshot.data[index].name}'),
                                    subtitle:
                                        Text('${snapshot.data[index].rating}' ),
                                    trailing:
                                        Text(
                                          // ignore: unnecessary_string_interpolations
                                          '${snapshot.data[index].price}',
                                          style: const TextStyle(color: Colors.green),
                                          ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute<void>(
                                            builder: (context) =>
                                                BusinessDetail(
                                                    business:
                                                        snapshot.data[index])),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              }),
        )
        // body: FutureBuilder(
        //   future: httpService.getPosts(),
        //   builder:
        //       (BuildContext context, AsyncSnapshot<List<Business>> snapshot) {
        //     if (snapshot.hasData) {
        //       // ignore: omit_local_variable_types
        //       final List<Business> business = snapshot.data;
        //       return ListView(
        //         children: business
        //             .map((Business businesses) => ListTile(
        //                   title: Text(businesses.name),
        //                 ))
        //             .toList(),
        //       );
        //     }
        //     return const Center(child: CircularProgressIndicator());
        //   },
        // )
        );
  }
}
