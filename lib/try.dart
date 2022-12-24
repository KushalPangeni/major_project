import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class AssetsAudio extends StatefulWidget {
  const AssetsAudio({super.key});

  @override
  State<AssetsAudio> createState() => _AssetsAudioState();
}

class _AssetsAudioState extends State<AssetsAudio> {
  AssetsAudioPlayer assetsaudio = AssetsAudioPlayer();
  @override
  void initState() {
    super.initState();
    open();
  }

  void open() {
    assetsaudio.open(Audio('songs2/RaatBhar.mp3'),
        autoStart: false, showNotification: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.amber,
            // height: 50,
            child: IconButton(
                iconSize: 70,
                onPressed: () {
                  // assetsaudio.open(Audio('songs/RaatBhar.mp3'),
                  //     autoStart: false, showNotification: true);
                  assetsaudio.play();
                },
                icon: const Icon(
                  Icons.play_arrow,
                  // size: 50,
                )),
          ),
          Container(
            color: Colors.amber,
            // height: 50,
            child: IconButton(
                iconSize: 70,
                onPressed: () {
                  // assetsaudio.open(Audio('songs/RaatBhar.mp3'),
                  //     autoStart: false, showNotification: true);
                  assetsaudio.pause();
                },
                icon: const Icon(
                  Icons.pause,
                  // size: 50,
                )),
          )
        ],
      ),
    );
  }
}
