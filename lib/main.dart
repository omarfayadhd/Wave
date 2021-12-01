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
        backgroundColor: Colors.orange[200],
        //appBar: AppBar(),
        body: SafeArea(
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.home)),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.playlist_add_check)),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
              IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            ],
          ),
        ));
  }
}
