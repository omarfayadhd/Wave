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
        backgroundColor: Colors.black12,
        //bottomNavigationBar: AppBar(),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.home),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.play_arrow),
                    iconSize: 30,
                    color: Colors.blue,
                    alignment: Alignment.bottomRight,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.celebration_rounded),
                    color: Colors.red,
                    iconSize: 30,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu_open),
                    color: Colors.yellow,
                    iconSize: 30,
                    alignment: Alignment.topRight,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.trending_up_outlined),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
