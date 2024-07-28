import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profileView extends StatefulWidget {
  const profileView({Key? key}) : super(key: key);

  @override
  _profileViewState createState() => _profileViewState();
}

class _profileViewState extends State<profileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.red),
            onPressed: () {
              // passing this to our root
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: Container(
                alignment: Alignment(0.0, 2.5),
                child: CircleAvatar(
                  radius: 60.0,
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              "Name",
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w400),
            )
          ],
        )));
  }
}
