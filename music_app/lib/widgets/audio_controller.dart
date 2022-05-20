import 'package:flutter/material.dart';
import 'package:music_app/providers/playing_song.dart';
import 'package:provider/provider.dart';

class AudioController extends StatefulWidget {
  const AudioController({Key? key}) : super(key: key);

  @override
  State<AudioController> createState() => _AudioControllerState();
}

class _AudioControllerState extends State<AudioController> {
  var duration = Duration();
  var position = Duration(seconds: 0);
  bool isPlaying = true;

  @override
  void initState() {
    Duration temp = Duration(seconds: 0);
    Duration temp2 = Duration(seconds: 0);
    Provider.of<PlayingSong>(context, listen: false)
        .audioPlayer
        .onDurationChanged
        .listen((event) {
      temp2 = event;
    });
    Provider.of<PlayingSong>(context, listen: false)
        .audioPlayer
        .onAudioPositionChanged
        .listen((event) {
      temp = event;
    });
    setState(() {
      position = temp;
    });
    setState(() {
      duration = temp2;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var playingsong = Provider.of<PlayingSong>(context, listen: false);
    Future.delayed(Duration.zero, () {
      setState(() {
        position = playingsong.getPosition();
        duration = playingsong.getDuration();
      });
    });

    void changeToSecond(int second) {
      Duration newDuration = Duration(seconds: second);
      playingsong.audioPlayer.seek(newDuration);
    }

    Widget slider() {
      return Slider(
        activeColor: Color(0xff4CD964),
        inactiveColor: Colors.grey,
        value: position.inSeconds.toDouble(),
        min: 0.0,
        max: duration.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            changeToSecond(value.toInt());
            value = value;
          });
        },
      );
    }

    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Center(
        child: Column(
          children: [
            slider(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(position.toString().split(".")[0].split(":")[1] +
                      ":" +
                      position.toString().split(".")[0].split(":")[2]),
                  Text(duration.toString().split(".")[0].split(":")[1] +
                      ":" +
                      duration.toString().split(".")[0].split(":")[2]),
                ],
              ),
            ),
            SizedBox(),
            Container(
              width: 600,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.place,
                          size: 15,
                        )),
                    IconButton(
                        onPressed: () async {
                          if (playingsong.isPlaying) {
                            playingsong.pause();
                          } else {
                            playingsong.resume();
                          }
                          playingsong.changeState();
                          setState(() {
                            isPlaying = playingsong.isPlaying;
                          });
                        },
                        icon: Icon(
                          playingsong.isPlaying
                              ? Icons.pause
                              : Icons.play_circle_sharp,
                          size: 50,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.face,
                          size: 15,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
