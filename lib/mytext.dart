import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myText extends StatelessWidget {
  myText({super.key, this.data});

  String? data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data?? 'Text',
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
