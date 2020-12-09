import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  // ignore: sort_constructors_first
  DatabaseService({ this.uid });
  //collection reference
  final CollectionReference reservationCollection = FirebaseFirestore.instance.collection('reservations');
}