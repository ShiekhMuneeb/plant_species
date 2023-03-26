import 'package:flutter/material.dart';
import 'package:plant_species/FAQ.dart';
import 'package:plant_species/History.dart';
import 'package:plant_species/about.dart';
import 'package:plant_species/home.dart';
import 'package:plant_species/dashboard.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  final _pageOptions = [
    Dashboard(),
    FAQ(),
    History(),
    About(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: (int index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      //   items: [
      //     const BottomNavigationBarItem(
      //       activeIcon: Icon(
      //         Icons.home,
      //         color: Colors.white,
      //       ),
      //       icon: Icon(
      //         Icons.home,
      //         color: Colors.black,
      //       ),
      //       backgroundColor: Colors.lightGreen,
      //       label: "Home",
      //     ),
      //     const BottomNavigationBarItem(
      //       activeIcon: Icon(
      //         Icons.question_answer,
      //         color: Colors.white,
      //       ),
      //       icon: Icon(
      //         Icons.question_answer,
      //         color: Colors.black,
      //       ),
      //       backgroundColor: Colors.lightGreen,
      //       label: "FAQ",
      //     ),
      //     const BottomNavigationBarItem(
      //       activeIcon: Icon(
      //         Icons.history,
      //         color: Colors.white,
      //       ),
      //       icon: Icon(
      //         Icons.history,
      //         color: Colors.black,
      //       ),
      //       backgroundColor: Colors.lightGreen,
      //       label: "History",
      //     ),
      //     const BottomNavigationBarItem(
      //       activeIcon: Icon(
      //         Icons.info,
      //         color: Colors.white,
      //       ),
      //       icon: Icon(
      //         Icons.info,
      //         color: Colors.black,
      //       ),
      //       backgroundColor: Colors.lightGreen,
      //       label: "About",
      //     ),
      //   ],
      // ),
    );
  }
}
