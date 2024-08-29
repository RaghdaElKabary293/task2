import 'package:flutter/material.dart';

import '../widgets/myTextField.dart';
import '../widgets/mytext.dart';

class Textfield extends StatefulWidget {
  const Textfield({super.key});

  @override
  State<Textfield> createState() => _TextfieldState();
}

class _TextfieldState extends State<Textfield> {
  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  int? result;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Mytextfield(
                      label: "Enter number",
                      hint: "Number",
                      controller: controller1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() {
                            result = null;
                          });
                          return "Number 1 is required";
                        }
                        return null;
                      }),
                  SizedBox(height: 15),
                  Mytextfield(
                      label: "Enter number",
                      hint: "Number",
                      controller: controller2,
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() {
                            result = null;
                          });
                          return "Number 1 is required";
                        }
                        return null;
                      }),
                  Text(
                    '${result ?? ''}',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          int n1 = int.parse(controller1.text);
                          int n2 = int.parse(controller2.text);
                          result = n1 + n2;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: myText(
                      data: "Calculate",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
