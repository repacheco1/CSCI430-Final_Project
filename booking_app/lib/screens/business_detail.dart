import 'package:booking_app/models/business.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/services/auth.dart';


class BusinessDetail extends StatefulWidget {
  final Business business;
  //final AsyncSnapshot<List<Business>> business;

  // ignore: sort_constructors_first
  const BusinessDetail({this.business});

  @override
  _BusinessDetailState createState() => _BusinessDetailState();
}

class _BusinessDetailState extends State<BusinessDetail> {
  final db = FirebaseFirestore.instance;
  final AuthService _auth = AuthService();
  // ignore: unnecessary_string_interpolations
  String reservationName = '';
  String reservationDate = ' ';
  String reservationTime = ' ';
  DateTime datePicked;
  TimeOfDay timePicked;


  @override
  void initState() {
    super.initState();
    datePicked = DateTime.now();
    timePicked = TimeOfDay.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: unnecessary_string_interpolations
        title: Text('${widget.business.name}'),
      ),
      body: Column(
        children: <Widget> [
          Image.network(widget.business.imageUrl, width: 600, height: 240, fit: BoxFit.fill,),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('City: ' + widget.business.city, style: const TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Address: ' + widget.business.address1, style: const TextStyle(fontSize: 20),  
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Zip code: ' + widget.business.zip, style: const TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Phone Number: ' + widget.business.display_phone, style: const TextStyle(fontSize: 20)
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  print('Hello');
                  _pickDate();
                  print(datePicked);
                },
                child: const Text('Pick day'),
                color: Colors.green,
              ),
              FlatButton(
                onPressed: () {
                  _pickTime();
                },
                child: const Text('Pick time'),
                color: Colors.green,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${datePicked.month}/' '${datePicked.day}/' '${datePicked.year}', 
                style: const TextStyle(fontSize: 20)
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${timePicked.hour}:${timePicked.minute}', 
                  style: const TextStyle(fontSize: 20),
                  ),
                ),
            ],
          ),
          FlatButton(
            onPressed: () {
              // ignore: unnecessary_string_interpolations
              reservationName = '${widget.business.name}';
              _setReservation();
              Navigator.pop(context);
            },
            child: const Text('Confirm'),
            color: Colors.green,
          ),
        ],
        //child: Image.network(business.imageUrl),
      ),
    );
  }
    // ignore: avoid_void_async
    void _pickDate() async {
      // ignore: omit_local_variable_types
      final DateTime date = await showDatePicker(
        context:context,
        firstDate: DateTime(DateTime.now().year-5),
        lastDate: DateTime(DateTime.now().year+5),
        initialDate: datePicked,
      );

      if(date != null) {
        setState(() {
          datePicked = date;
          reservationDate = '${datePicked.month}/' '${datePicked.day}/' '${datePicked.year}';
        });
      }
    }
    // ignore: avoid_void_async
    void _pickTime() async {
      // ignore: omit_local_variable_types
      final TimeOfDay time = await showTimePicker(
        context:context,
        initialTime: timePicked,
      );

      if(time != null) {
        setState(() {
          timePicked = time;
          reservationTime = '${timePicked.hour}:${timePicked.minute}';
        });
      }
    }
    // ignore: avoid_void_async
    void _setReservation() async {
      final dynamic user = await _auth.getUser();
      final uid = user.uid.toString();
      // ignore: omit_local_variable_types
      final data = {
              // ignore: unnecessary_string_interpolations
              'Uid': '$uid',
              // ignore: unnecessary_string_interpolations
              'name': '$reservationName'.toString(),
              // ignore: unnecessary_string_interpolations
              'date': '$reservationDate'.toString(),
              // ignore: unnecessary_string_interpolations
              'time': '$reservationTime'.toString(),
            };
            // ignore: unused_local_variable
            final ref = await db.collection('reservation').add(data);
    }

    
}
