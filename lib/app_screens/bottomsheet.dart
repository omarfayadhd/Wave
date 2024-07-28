import 'package:flutter/material.dart';

import 'package:wave_dev/app_screens/Profile.dart';

import 'land.dart';

class Bottom {
  void _popup(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.black87,
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
