// import 'dart:developer';

// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:major_project/playseparate.dart';
// import 'package:major_project/songs.dart';

class AssetsAudio extends StatefulWidget {
  final int source;
  const AssetsAudio({super.key, required this.source});

  @override
  State<AssetsAudio> createState() => _AssetsAudioState();
}

class _AssetsAudioState extends State<AssetsAudio> {
  late int endex = widget.source;
  // PlayerSeparate playier = PlayerSeparate();

  // List<Map> musiclist = musicList;

  // final player = AssetsAudioPlayer();
  @override
  void initState() {
    super.initState();
    // open(source);
  }

  // eindex(int a) {
  //   setState(() {
  //     log(a.toString() + ' Asset index');
  //     endex = a;
  //     log(endex.toString() + ' Asset endex value');
  //   });
  // }
//1
  // void open(int src) {
  //   player.open(Audio(musicList[src]['trackDetails']['source']),
  //       autoStart: false, showNotification: true);
  //   log(player.isPlaying.value.toString() + ' is it bool or not');
  // }
//1
  // void open(String src) {
  //   assetsaudio.open(
  //     Audio(src),
  //     autoStart: false,
  //   );
  //   log('done played');
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 50,
      child: Row(
        children: [
          Expanded(
              child: IconButton(
                  onPressed: () {
                    PlayerSeparate().playy();
                  },
                  icon: const Icon(Icons.play_arrow))),
          Expanded(
              child: IconButton(
                  onPressed: () {
                    PlayerSeparate().pausee();
                  },
                  icon: const Icon(Icons.pause)))
        ],
      ),
    );
  }
}
