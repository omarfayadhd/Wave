import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      fontSize: 25,
                    ))
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            const TextField(
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
      );
  }


}