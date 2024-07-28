import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      bottomNavigationBar: Container(
          height: 55.0,
          child: BottomAppBar(
            color: Color.fromRGBO(58, 66, 86, 1.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton.icon(
                  icon: ImageIcon(AssetImage("assets/Github.png"), size: 24),
                  label: Text(''),
                  onPressed: () {},
                ),

                /* IconButton(
                  icon: Icon(Icons., color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.upload, color: Colors.white),
                  onPressed: () {},
                ),*/
              ],
            ),
          )),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(left: 25, right: 25, top: 10),
        child: const Text('WaVe',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.yellowAccent,
                fontSize: 25)),
      ),
    );
  }
}
