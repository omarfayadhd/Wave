import 'dart:ui';
import 'package:wave_dev/app_screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:wave_dev/app_screens/land.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color blackTextFild = Color(0xFF262A34);
    FocusNode myFocusNode = new FocusNode();
    FocusNode myFocusNode1 = new FocusNode();
    return Scaffold(
        backgroundColor: Colors.black,
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold))
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              TextField(
                focusNode: myFocusNode1,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Color(0xFF262A34),
                  labelText: "Email",
                  hintText: "info@gmail.com",
                  suffixIcon: Icon(Icons.email),
                  labelStyle: TextStyle(
                      fontSize: 15,
                      color:
                          myFocusNode1.hasFocus ? Colors.blue : Colors.white),
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
                  focusNode: myFocusNode,
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Color(0xFF262A34),
                    labelText: "Password",
                    labelStyle: TextStyle(
                        fontSize: 15,
                        color:
                            myFocusNode.hasFocus ? Colors.blue : Colors.white),
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
              Text(
                "Dont have an account?",
                style: TextStyle(fontSize: 12.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
                width: 20,
                child: ElevatedButton(
                  child: Text('SignUp'),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
