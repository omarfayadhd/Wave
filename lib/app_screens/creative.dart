import 'package:flutter/material.dart';

import 'package:wave_dev/app_screens/picking.dart';

class creative extends StatefulWidget {
  const creative({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.black,
            title: Text(
              'Drop',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )),*/

        backgroundColor: Colors.black12,
        body: SafeArea(
            child: Column(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.home),
                        color: Colors.white,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        iconSize: 30,
                      ),
                      /* Text(
                        'Drop',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),*/
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.donut_large_sharp),
                        color: Colors.white,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        iconSize: 30,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => MyApp()));
                        },
                        icon: Icon(Icons.upload),
                        iconSize: 30,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        color: Colors.blue,
                        alignment: Alignment.bottomRight,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.star_border_purple500),
                        color: Colors.green,
                        iconSize: 30,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Card(
                  elevation: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    child: Image.asset(
                      'assets/image.jpeg',
                      height: 50,
                      width: 70,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  //padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    /// Add this
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Vennila Chandanakinnam',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      Text(
                        '3.5',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        )));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
