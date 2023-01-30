// ignore_for_file: use_key_in_widget_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get_it/get_it.dart';
import 'package:major_project/player/playseparate.dart';

class MSlider extends StatefulWidget {
  // final String pathName;
  // const MSlider(this.pathName);

  // const Music({super.key,@required String pathname});
  const MSlider({Key? key}) : super(key: key);

  @override
  State<MSlider> createState() => _MSliderState();
}

class _MSliderState extends State<MSlider> {
  final PlayerSeparate playerSeparate = GetIt.instance.get<PlayerSeparate>();

  List<FileSystemEntity> songs = [];
  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  late String songPathName;

  @override
  void initState() {
    super.initState();

    // songPathName = widget.pathName;

    //listen to states : Playing Pause Stop
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    //listen to audio duration
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    //listen to audio position
    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    setAudio();

    // getSongs();
  }

  @override
  void dispose() {
    super.dispose();
    if (isPlaying = true) {
      player.dispose();
    }
  }

  Future setAudio() async {
    // await player.setSource(AssetSource('songs/music3.mp3'));
    // DeviceFileSource(songPathName);
    // player.play(DeviceFileSource(songPathName));
    player.setSource(AssetSource(songPathName));
    // player.play()

    // player.setSource(AssetSource('songs/music1.mp3'));
    // log('player.setSours');
    // player.play();
    isPlaying = true;

    // String audioasset = "assets/audio/ambulance_sound.mp3";
    // ByteData bytes = await rootBundle.load(audioasset); //load sound from assets
    // Uint8List soundbytes =
    // bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    // int result = await player.playBytes(soundbytes);
    // if (result == 1) {
    //play success
    // print("Sound playing successful.");
    // } else {
    // print("Error while playing sound.");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: SizedBox(
          // height: 50,
          child: Column(
            children: [
              Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      final position = Duration(seconds: value.toInt());
                      player.seek(position);
                      // changeToSeconds(value.toInt());
                      // value = value;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text(position.toString().split('.')[0]),
                    // Text((duration - position).toString().split('.')[0]),
                    //this upper one is so easy to make

                    Text(formatTime(position)),
                    Text(formatTime(duration - position))
                    // Text('$duration.')
                  ],
                ),
              ),
              CircleAvatar(
                child: IconButton(
                  icon: Icon(playerSeparate.player.playing
                      ? Icons.pause
                      : Icons.play_arrow),
                  onPressed: () {
                    setState(() {
                      if (playerSeparate.player.playing) {
                        playerSeparate.player.pause();
                      } else {
                        playerSeparate.player.play();
                      }
                    });
                    // setState(() {
                    //   if (isPlaying) {
                    //     player.pause();
                    //   } else {
                    //     // DeviceFileSource(songPathName);
                    //     // player.play(DeviceFileSource(songPathName));
                    //     // log('messageOnPressed');
                    //     player.resume();
                    //   }
                    // });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigit(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigit(duration.inHours);
    final minutes = twoDigit(duration.inMinutes.remainder(60));
    final seconds = twoDigit(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
