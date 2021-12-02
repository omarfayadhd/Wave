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
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                suffixIcon: Icon(Icons.email),
                labelStyle: TextStyle(fontSize: 20),
                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(20.0),
                ),
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
                  suffixIcon: Icon(Icons.visibility_off),
                  border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(20.0),
                ),
                  filled: true,
                )),
            SizedBox(
              height: 20,
            ),

          Padding(padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children: [Text('Forget Password?', style:TextStyle(fontSize: 18.0, color: Colors.red),),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {},
               style:  ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
          Text("Dont have an account? SignUp", 
          textAlign: TextAlign.center,)
          ],
        ),
      );
  }


}