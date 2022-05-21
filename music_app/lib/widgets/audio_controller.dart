import 'package:flutter/material.dart';
import 'package:music_app/providers/playing_song.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../providers/auth.dart';

class AudioController extends StatefulWidget {
  const AudioController({Key? key}) : super(key: key);

  @override
  State<AudioController> createState() => _AudioControllerState();
}

class _AudioControllerState extends State<AudioController> {
  var duration = Duration();
  var position = Duration(seconds: 0);
  bool isPlaying = true;
  bool isSuffle = false;
  bool isReplay = false;

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

  void showCreateDialog(BuildContext context, int songid) async {
    await Provider.of<Auth>(context, listen: false).fetchPlaylists();
    var playlist = Provider.of<Auth>(context, listen: false).playlists;
    showDialog(
        context: context,
        builder: (ctx) {
          return SimpleDialog(
            title: Center(child: const Text('Add to your playlists:')),
            children: playlist.isEmpty
                ? List.generate(
                    1,
                    (ctx) => Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Center(
                              child: Text('You don\'t have any playlist')),
                        )) as List<Widget>
                : [
                    ...playlist.map(
                      (e) => TextButton(
                          onPressed: () async {
                            await Provider.of<Auth>(context, listen: false)
                                .addSongToPlaylist(e.id, songid);
                            Navigator.pop(context);
                          },
                          child: Text(
                            e.name,
                            style: TextStyle(fontSize: 20),
                          )),
                    )
                  ],
          );
        });
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
                  Text(
                    position.toString().split(".")[0].split(":")[1] +
                        ":" +
                        position.toString().split(".")[0].split(":")[2],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                      duration.toString().split(".")[0].split(":")[1] +
                          ":" +
                          duration.toString().split(".")[0].split(":")[2],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(children: [
                      Positioned(
                        child: FaIcon(
                          FontAwesomeIcons.shuffle,
                          color: Color(0xff4CD964),
                        ),
                        left: 10,
                        top: 10,
                      ),
                      IconButton(
                        iconSize: 22,
                        onPressed: () {},
                        icon: FaIcon(FontAwesomeIcons.shuffle),
                      ),
                    ]),
                    IconButton(
                        onPressed: () {},
                        iconSize: 30,
                        icon: FaIcon(FontAwesomeIcons.stepBackward)),
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
                        iconSize: 50,
                        // color: Color(0xff4CD964),
                        icon: FaIcon(
                          playingsong.isPlaying
                              ? FontAwesomeIcons.pauseCircle
                              : FontAwesomeIcons.solidCirclePlay,
                        )),
                    IconButton(
                        onPressed: () {
                          Provider.of<PlayingSong>(context, listen: false)
                              .setPlayingSong(27);
                        },
                        iconSize: 30,
                        icon: FaIcon(FontAwesomeIcons.stepForward)),
                    IconButton(
                        iconSize: 22,
                        onPressed: () {},
                        icon: FaIcon(
                          FontAwesomeIcons.repeat,
                        )),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  IconButton(
                      onPressed: () {
                        showCreateDialog(context, playingsong.id as int);
                      },
                      icon: FaIcon(FontAwesomeIcons.list))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
