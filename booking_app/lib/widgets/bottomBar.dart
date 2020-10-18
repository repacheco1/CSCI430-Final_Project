import 'package:flutter/material.dart';
import 'package:booking_app/screens/home.dart';
import 'package:booking_app/screens/reservation.dart';
import 'package:booking_app/screens/bookings.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBar createState() =>
      _BottomBar();
}

class _BottomBar extends State<BottomBar> {
  final List<Widget> pages = [
    ReservationPage(
      key: PageStorageKey('ReservationPage'),
    ),
    HomePage(
      key: PageStorageKey('HomePage'),
    ),
    BookingsPage(
      key: PageStorageKey('BookingsPage'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant),
              label: 'Reservation'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home), 
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), 
              label: 'Bookings'),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
  
}