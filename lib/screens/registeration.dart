import 'package:flutter/material.dart';
import 'package:new_8/app_auth.dart';
import 'package:new_8/screens/HomaNavigation.dart';
import 'package:new_8/screens/login.dart';

import '../widgets/myTextField.dart';
import '../widgets/mytext.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  var EmailRegController = TextEditingController();
  var PassRegController = TextEditingController();
  var PhoneRegController = TextEditingController();
  var NamesRegController = TextEditingController();
  bool isVisible = true;
  var icon = Icon(Icons.visibility);
  var iconOff = Icon(Icons.visibility_off);
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Page"),
      ),
      body: Center(
          child: SafeArea(
              child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Mytextfield(
                controller: EmailRegController,
                prefix: Icon(Icons.mail),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This Field is Required';
                  }
                  return null;
                },
                label: "Email",
                hint: "Enter Email",
              ),
              SizedBox(
                height: 15,
              ),
              Mytextfield(
                controller: PassRegController,
                isVisible: isVisible,
                prefix: Icon(Icons.lock),
                suffix: InkWell(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: isVisible ? iconOff : icon,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This Field is Required';
                  }
                  return null;
                },
                label: "Password",
                hint: "Enter Password",
              ),
              SizedBox(
                height: 15,
              ),
              Mytextfield(
                controller: PhoneRegController,
                prefix: Icon(Icons.phone),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This Field is Required';
                  }
                  return null;
                },
                label: "Phone",
                hint: "Enter Phone Number",
              ),
              SizedBox(
                height: 15,
              ),
              Mytextfield(
                controller: NamesRegController,
                prefix: Icon(Icons.person),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This Field is Required';
                  }
                  return null;
                },
                label: "Name",
                hint: "Enter Name",
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(Duration(seconds: 2));
                    AppAuth.registerUser(
                            email: EmailRegController.text,
                            pass: PassRegController.text,
                            name: NamesRegController.text,
                            phone: PhoneRegController.text,
                            context: context)
                        .then(((value) {
                      if (value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => home()),
                            (route) => false);
                      }
                    }));
                  }
                  setState(() {
                    EmailRegController.clear();
                    PassRegController.clear();
                    PhoneRegController.clear();
                    NamesRegController.clear();
                    isLoading = false;
                  });
                },
                child: isLoading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : myText(
                        data: "Register",
                      ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                  },
                  child: myText(
                    data: "Already have an account? Sign in now",
                    color: Colors.grey,
                  ))
            ],
          ),
        ),
      ))),
    );
  }
}
