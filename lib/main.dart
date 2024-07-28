import 'package:flutter/material.dart';
import 'app_screens/login.dart';
import 'package:firebase_core/firebase_core.dart';

//uyguyguyuyguy
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Wave());
}

class Wave extends StatefulWidget {
  const Wave({Key? key}) : super(key: key);

  @override
  _WaveState createState() => _WaveState();
}

class _WaveState extends State<Wave> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const LandingScreen(),
    );
  }
}

//////////////////////

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
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
                        onPressed: () {},
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
                        onPressed: () {},
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
}
