import 'package:flutter/material.dart';
import 'package:trainingbasicflutter/HomePage.dart';
import 'package:trainingbasicflutter/akun_profile.dart';

class HomeScreen extends StatefulWidget {
  final int? initTab;

  HomeScreen({this.initTab});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavBar = 0;

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavBar = index;
    });
  }

  final _widgetOptions = [
    HomePage(),
    HomePage(),
    Akun(),
    HomePage(),
    Container(),
    Container(),
  ];

  @override
  void initState() {
    _selectedNavBar = widget.initTab ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedNavBar],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _changeSelectedNavBar,
        currentIndex: _selectedNavBar,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'settings'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'chat'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'chat'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
      ),
    );
  }
}
