import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myText extends StatelessWidget {
  myText({super.key, this.data, this.color});

  String? data;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      data ?? 'Text',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      ),
    );
  }
}
