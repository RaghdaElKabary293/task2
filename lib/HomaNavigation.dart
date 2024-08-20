import 'package:flutter/material.dart';
import 'package:new_8/GridPage.dart';
import 'package:new_8/Task%202.dart';
import 'package:new_8/task1.dart';

import 'TextField.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  List<Widget> _screens = [
    Task1(),
    task2(),
    grid(),
    Textfield(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _index,
        onTap: (index){
          setState(() {
            _index = index;
          });
        },

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.looks_one_sharp), label: "Count"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_two_sharp), label: "Slide"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_3x3_sharp), label: "Grid"),
          BottomNavigationBarItem(icon: Icon(Icons.calculate_sharp), label: "Calculator"),
        ],
      ),
    );
  }
}
