import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_8/screens/GridPage.dart';
import 'package:new_8/screens/login.dart';
import 'package:new_8/screens/task1.dart';
import 'package:new_8/widgets/mytext.dart';

import 'Task 2.dart';
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

  List<String> titles = [
    'Counter',
    'Slider',
    'GridView',
    'Calculator',
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_index]),
      ),
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_one_sharp), label: "Count"),
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_two_sharp), label: "Slide"),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_3x3_sharp), label: "Grid"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate_sharp), label: "Calculator"),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => login()),
                    (route) => false);
              },
              child: myText(
                data: "Sign Out",
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
            )
          ],
        ),
      ),
    );
  }
}
