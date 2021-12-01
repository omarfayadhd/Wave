import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

main() {
  runApp(Wave());
}

class Wave extends StatelessWidget {
  const Wave({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: LandingScreen(),
    );
  }
}

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Text("Login",
                    style: TextStyle(
                      fontSize: 25,
                    ))
              ],
            ),
            SizedBox(
              height: 60,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(fontSize: 20),
                filled: true,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 20),
                  filled: true,
                )),
            SizedBox(
              height: 20,
            ),
            Column(
              children: <Widget>[
                ButtonTheme(
                  height: 50,
                  disabledColor: Colors.blueAccent,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Login',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("New User? Sign Up")
              ],
            )
          ],
        ),
      ),
    );
  }//gghg
}
