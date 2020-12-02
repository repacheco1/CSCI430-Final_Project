import 'package:booking_app/models/business.dart';
import 'package:flutter/material.dart';

class BusinessDetail extends StatelessWidget {
  final Business business;
  //final AsyncSnapshot<List<Business>> business;

  // ignore: sort_constructors_first
  const BusinessDetail({this.business});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: unnecessary_string_interpolations
        title: Text('${business.name}'),
      ),
      body: Column(
        children: <Widget> [
          Image.network(business.imageUrl, width: 600, height: 240, fit: BoxFit.fill,),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('City: ' + business.city, style: const TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Address: ' + business.address1, style: const TextStyle(fontSize: 20),  
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Zip code: ' + business.zip, style: const TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Phone Number: ' + business.display_phone, style: const TextStyle(fontSize: 20)
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: const Text('Reserve a time'),
            color: Colors.green,
          ),
        ],
        //child: Image.network(business.imageUrl),
      ),
    );
  }
}
