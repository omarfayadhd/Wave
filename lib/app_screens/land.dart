import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wave_dev/app_screens/audio_page.dart';
import 'package:wave_dev/app_screens/login.dart';
import 'package:wave_dev/model/user_model.dart';
import 'package:wave_dev/app_screens/Profile.dart';

class land extends StatefulWidget {
  const land({Key? key}) : super(key: key);

  @override
  _landState createState() => _landState();
}

class _landState extends State<land> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        //bottomNavigationBar: AppBar(),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.trending_up_sharp),
                        color: Colors.white,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        iconSize: 30,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search),
                        iconSize: 30,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        color: Colors.blue,
                        alignment: Alignment.bottomRight,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.home),
                        color: Colors.white,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        iconSize: 30,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Audio_Page()));
                        },
                        icon: Icon(Icons.play_arrow),
                        iconSize: 30,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        color: Colors.blue,
                        alignment: Alignment.bottomRight,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.celebration_rounded),
                        color: Colors.red,
                        iconSize: 30,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                      ),
                      IconButton(
                        onPressed: () {
                          _popup(context);
                        },
                        icon: Icon(Icons.menu_open),
                        color: Colors.yellow,
                        iconSize: 30,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        alignment: Alignment.topRight,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )));
  }

  void _popup(context) {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        context: context,
        builder: (BuildContext bc) {
          return Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              height: MediaQuery.of(context).size.height * .30,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.person_outline,
                              size: 25,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => profileView()));
                            },
                            child: Text("My Account",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'Lora',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.settings,
                              size: 25,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          Text("Settings",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(
                              Icons.info,
                              size: 25,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                          Text("About",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.logout,
                              size: 25,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              logout(context);
                            },
                          ),
                          ActionChip(
                            label: Text("Logout",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            onPressed: () {
                              logout(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  )));
        });
  }
}

// the logout function
Future<void> logout(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
}
