import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:wave_dev/app_screens/audio_system.dart';
import 'audio_system.dart';

class Audio_Page extends StatefulWidget {
  final audioPath;
  final int index;
  const Audio_Page({Key? key, this.audioPath, required this.index})
      : super(key: key);

  @override
  _Audio_PageState createState() => _Audio_PageState();
}

class _Audio_PageState extends State<Audio_Page> {
  late AudioPlayer wavePlayer;

  @override
  void initState() {
    super.initState();
    wavePlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight / 3,
              child: Container(
                color: Colors.black,
              )),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: () {},
                  )
                ],
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              )),
          Positioned(
              left: 0,
              right: 0,
              top: screenHeight * 0.2,
              height: screenHeight * 0.36,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.1,
                    ),
                    Text(
                      this.widget.audioPath[this.widget.index]["title"],
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Avenir"),
                    ),
                    Text(
                      this.widget.audioPath[this.widget.index]["text"],
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    AusioSys(
                        wavePlayer: wavePlayer,
                        audioPath: this.widget.audioPath[this.widget.index]
                            ["audio"]),
                  ],
                ),
              )),
          Positioned(
              top: screenHeight * 0.12,
              left: (screenWidth - 150) / 2,
              right: (screenWidth - 150) / 2,
              height: screenHeight * 0.16,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white, width: 2),
                      color: Colors.white70),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white70, width: 5),
                          image: DecorationImage(
                              image: AssetImage(this
                                  .widget
                                  .audioPath[this.widget.index]["img"]),
                              fit: BoxFit.cover)),
                    ),
                  )))
        ],
      ),
    );
  }
}
