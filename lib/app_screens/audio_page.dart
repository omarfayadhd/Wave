import 'dart:convert';

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

class _Audio_PageState extends State<Audio_Page>
    with SingleTickerProviderStateMixin {
  late AudioPlayer wavePlayer;

  //late ScrollController _scrollController;
  var songs;
  var mal;
  var wavers;

  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json_files/wavers.json")
        .then((s) {
      setState(() {
        wavers = json.decode(s);
      });
    });

    await DefaultAssetBundle.of(context)
        .loadString("json_files/songs.json")
        .then((s) {
      setState(() {
        songs = json.decode(s);
      });
    });
  }

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
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight / 3,
              child: Container(
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),

                    image: DecorationImage(
                        image: AssetImage(
                            this.widget.audioPath[this.widget.index]["img"]),
                        fit: BoxFit.cover)),
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
          /////////////////////title box///////////////////
          Positioned(
              left: 0,
              right: 0,
              top: screenHeight * 0.2,
              height: screenHeight * 0.36,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.black38, width: 6),

                    //////controlbox/////
                    color: Colors.white),
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
          ///////////////////////circle image//////////////////////
          Positioned(
              top: screenHeight * 0.12,
              left: (screenWidth - 150) / 2,
              right: (screenWidth - 150) / 2,
              height: screenHeight * 0.16,
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white54, width: 6),
                      image: DecorationImage(
                          image: AssetImage(
                              this.widget.audioPath[this.widget.index]["img"]),
                          fit: BoxFit.cover)),
                ),
              ))),
          ///////////////////////////////////////////////

          Row(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 500, left: 19),
                  child: Text("Waver'S",
                      style: TextStyle(fontSize: 30, color: Colors.white)))
            ],
          ),

          Container(
              margin: const EdgeInsets.only(top: 560, left: 0),
              height: 280,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.6),
                  //itemCount: wavers == null ? 0 : wavers.length,
                  itemBuilder: (_, i) {
                    return Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          image: DecorationImage(
                              image: AssetImage("assets/atr1.jpg")),
                        ));
                  }))
        ], //
      ),
    );
  }

/*
  miniPlayer() {
    Size deviceSize = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      color: Colors.blue,
      width: deviceSize.width,
      height: 50,
      child: Row(
        children: [
          Image(image: this.widget.audioPath[this.widget.index]["img"]),
          Text(this.widget.audioPath[this.widget.index]["title"]),
          IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow))
        ],
      ),
    );
  }*/

}
