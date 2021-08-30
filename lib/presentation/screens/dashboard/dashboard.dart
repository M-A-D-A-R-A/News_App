import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/home_screen/home_screen.dart';

import '../../../core/constants/strings.dart';

class DashBoard extends StatefulWidget {
  // HomeScreen({Key ?key, this.title}) : super(key: key);

  // final String ?title;

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  
  int _currentIndex = 0;

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  
  static const List<Widget> _tabs = <Widget>[
    HomeScreen(),
    Center(
      child: Text(
        'Sources',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        'Search',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    ),
  
  ];

  List<BottomNavigationBarItem> _item = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: "Home",
        backgroundColor: Colors.black),
    BottomNavigationBarItem(
        icon: Icon(Icons.source),
        label: "Sources",
        backgroundColor: Colors.black),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search),
        label: "Search",
        backgroundColor: Colors.black),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Strings.appTitle),
        elevation: 0.0,
      ),
      body: Material(child: Container(child: _tabs.elementAt(_currentIndex),),),
      bottomNavigationBar:  ClipRRect(
           borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),),
          child: BottomNavigationBar(
            items: _item,
            type: BottomNavigationBarType.shifting,
            currentIndex: _currentIndex,
            selectedItemColor: Colors.white38,
            onTap: _onTapped,
            backgroundColor: Colors.white38,
          ),
            
        ),
    );
  }
}
