import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  Mytextfield({super.key, this.label, this.hint, required this.controller, required this.validator});
  String? label;
  String? hint;
  var controller = TextEditingController();
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        label: Text(label?? "Label"),
        hintText: hint?? "Hint"
      ),
    );
  }
}
