import 'package:flutter/material.dart';
import 'package:new_8/HomaNavigation.dart';

import 'Task 2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
                centerTitle: true,
                titleTextStyle: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),
                color: Colors.blueGrey
            )
        ),
        home: home(),
        );
  }
}