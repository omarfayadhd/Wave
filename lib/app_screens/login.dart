import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:wave_dev/app_screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:wave_dev/app_screens/land.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = new FocusNode();
    FocusNode myFocusNode1 = new FocusNode();
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            children: <Widget>[
              Column(
                children: const <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Text("Login",
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold))
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              TextField(
                // focusNode: myFocusNode1,
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(
                  //fillColor: Color(0xFF262A34),
                  labelText: "Email",
                  hintText: "info@gmail.com",
                  suffixIcon: Icon(Icons.email),
                  labelStyle: TextStyle(
                      fontSize: 15,
                      color: myFocusNode1.hasFocus ? Colors.blue : Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  filled: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                  //focusNode: myFocusNode,
                  style: TextStyle(color: Colors.blue),
                  obscureText: true,
                  decoration: InputDecoration(
                    //  fillColor: Color(0xFF262A34),
                    labelText: "Password",
                    labelStyle: TextStyle(
                        fontSize: 15,
                        color:
                            myFocusNode.hasFocus ? Colors.blue : Colors.blue),
                    suffixIcon: Icon(Icons.visibility_off),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 15.0, color: Colors.red),
                    ),
                    ElevatedButton(
                      child: Text('Login'),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => land()));
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              /*Text(
                "Dont have an account?",
                style: TextStyle(fontSize: 12.0, color: Colors.black),
                textAlign: TextAlign.center,
              ),*/
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    text: "Don't have an account, ",
                    children: <TextSpan>[
                      TextSpan(
                          text: 'SignUp?',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()),
                              );
                            }),
                    ],
                  )),
              /* SizedBox(
                child: ElevatedButton(
                  child: Text('SignUp'),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),*/
            ],
          ),
        ));
  }
}
