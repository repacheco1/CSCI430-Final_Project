import 'package:booking_app/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:booking_app/models/user.dart';
import 'package:booking_app/widgets/bottomBar.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    //print(user);
    //return either Home or Authenticate Widget
    if (user == null) {
      return Authenticate();
    } else {
      return BottomBar();
    }
  }
}
