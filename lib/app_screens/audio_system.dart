import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/src/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:wave_dev/app_screens/audio_page.dart';

class AusioSys extends StatefulWidget {
  final AudioPlayer wavePlayer;
  final String audioPath;
  const AusioSys({Key? key, required this.wavePlayer, required this.audioPath})
      : super(key: key);

  @override
  _AusioSysState createState() => _AusioSysState();
}

class _AusioSysState extends State<AusioSys> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  bool isPlaying = false;
  bool isPaused = false;
  bool isRepeat = false;
  Color color = Colors.black;
  List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    super.initState();
    this.widget.wavePlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    this.widget.wavePlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });

    this.widget.wavePlayer.setUrl(this.widget.audioPath);
    this.widget.wavePlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _position = Duration(seconds: 0);
        if (isRepeat == true) {
          isPlaying = true;
        } else {
          isPlaying = false;
          isRepeat = false;
        }
      });
    });
  }

  Widget btnStart() {
    return IconButton(
      padding: const EdgeInsets.only(bottom: 10),
      icon: isPlaying == false
          ? Icon(
              _icons[0],
              size: 50,
            )
          : Icon(
              _icons[1],
              size: 50,
            ),
      onPressed: () {
        if (isPlaying == false) {
          this.widget.wavePlayer.play(this.widget.audioPath);
          setState(() {
            isPlaying = true;
          });
        } else if (isPlaying == true) {
          this.widget.wavePlayer.pause();

          setState(() {
            isPlaying = false;
          });
        }
      },
    );
  }

  Widget btnFast() {
    return IconButton(
      icon: ImageIcon(
        AssetImage('assets/next.png'),
        size: 15,
        color: Colors.black,
      ),
      onPressed: () {
        //this.widget.wavePlayer.setPlaybackRate(playbackRate:1.5)
      },
    );
  }

  Widget btnSlow() {
    return IconButton(
      icon: ImageIcon(
        AssetImage('assets/previous.png'),
        size: 15,
        color: Colors.black,
      ),
      onPressed: () {
        //this.widget.wavePlayer.setPlaybackRate(playbackRate:1.5)
      },
    );
  }

  Widget btnRepeat() {
    return IconButton(
      icon: ImageIcon(
        AssetImage('assets/repeat-button.png'),
        size: 15,
        color: color,
      ),
      onPressed: () {
        //this.widget.wavePlayer.setPlaybackRate(playbackRate:1.5)
        if (isRepeat == false) {
          this.widget.wavePlayer.setReleaseMode(ReleaseMode.LOOP);
          setState(() {
            isRepeat = true;
            color = Colors.blue;
          });
        } else if (isRepeat == true) {
          this.widget.wavePlayer.setReleaseMode(ReleaseMode.RELEASE);
          color = Colors.black;
          isRepeat = false;
        }
      },
    );
  }

  Widget btnLoop() {
    return IconButton(
      icon: ImageIcon(
        AssetImage('assets/Loop.png'),
        size: 15,
      ),
      onPressed: () {
        //this.widget.wavePlayer.setPlaybackRate(playbackRate:1.5)
      },
    );
  }

  Widget loadAsset() {
    return Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            btnRepeat(),
            btnSlow(),
            btnStart(),
            btnFast(),
            btnLoop(),
          ]),
    );
  }

  Widget slider() {
    return Slider(
        activeColor: Colors.red,
        inactiveColor: Colors.grey,
        value: _position.inSeconds.toDouble(),
        min: 0.0,
        max: _duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });
        });
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    this.widget.wavePlayer.seek(newDuration);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _position.toString().split(".")[0],
                style: TextStyle(fontSize: 16),
              ),
              Text(
                _duration.toString().split(".")[0],
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        slider(),
        loadAsset(),
      ],
    ));
  }
}
