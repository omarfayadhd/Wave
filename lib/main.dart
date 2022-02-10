import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app_screens/login.dart';

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
    return Scaffold(body: LoginScreen());
  }
}
