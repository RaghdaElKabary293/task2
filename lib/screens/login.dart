import 'package:flutter/material.dart';
import 'package:new_8/app_auth.dart';
import 'package:new_8/screens/registeration.dart';

import '../widgets/myTextField.dart';
import '../widgets/mytext.dart';
import 'HomaNavigation.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final _formkey = GlobalKey<FormState>();
  var EmailController = TextEditingController();
  var PassController = TextEditingController();
  bool isVisible = true;
  bool isLoading = false;
  var icon = Icon(Icons.visibility);
  var iconOff = Icon(Icons.visibility_off);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
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
                controller: EmailController,
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
                controller: PassController,
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
              ElevatedButton(
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(Duration(seconds: 2));
                    AppAuth.signIn(
                            email: EmailController.text,
                            pass: PassController.text,
                            context: context)
                        .then((value) {
                      if (value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => home()),
                            (route) => false);
                      }
                    });
                  }
                  setState(() {
                    EmailController.clear();
                    PassController.clear();
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
                        data: "Login",
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
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                  child: myText(
                    data: "Don't have an account? Register now",
                    color: Colors.grey,
                  ))
            ],
          ),
        ),
      ))),
    );
  }
}
