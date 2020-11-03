import 'package:flutter/material.dart';
import 'package:fluttertest/UI/Profile/profilePage.dart';
import 'package:fluttertest/UI/TheZone/TheZonePage.dart';
import 'models/global.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _title = 'The Zone';
  int _selectedIndex = 1;


  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w300, color: Colors.white, fontFamily: 'Lato');
  static  List<Widget> _widgetOptions = <Widget>[
    ProfilePage(),
    TheZonePage(),
    Text(
      'Live Coming Soon!',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch(index) { 
        case 0: { _title = 'Profile'; } 
        break; 
        case 1: { _title = 'The Zone'; } 
        break;
        case 2: { _title = 'Live'; } 
        break;
      } 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundGray,
      appBar: AppBar(
        title: Text(
          _title,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: 'Lato',
              fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.backgroundBlack,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: 'The Zone',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.live_tv_rounded),
            label: 'Live',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFFFFFFF),
        unselectedItemColor: AppTheme.sportGreen,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        iconSize: 30,
        onTap: _onItemTapped,
      ),
    );
  }
}