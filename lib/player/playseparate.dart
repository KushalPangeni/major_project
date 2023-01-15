import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:major_project/main.dart';
import 'package:major_project/songs.dart';

class PlayerSeparate {
  // final int source = 0;
  List<Map> musiclist = musicList;
  final player = AssetsAudioPlayer();
  bool isPlaying = false;
  late var durationn = '';

  // PlayerSeparate();
  // durationCurrent() {
  //   durationn = player.current.value!.audio.duration.toString().split('.')[0];
  //   log(durationn);
  // }

  playy() {
    isPlaying = true;
    isPlayed = true;
    player.play();
    log('playy');
    log(isPlaying.toString());
  }

  pausee() {
    isPlaying = false;
    isPlayed = false;
    player.pause();
    log('pausee');
    log(isPlaying.toString());
  }

  void open(int source) {
    log("message");
    // log(player.current.value!.audio.duration.toString().split('.')[0]);
    player.open(
      Audio(musicList[source]['trackDetails']['source']),
      autoStart: true,
      showNotification: true,
    );
    isPlaying = true;
    isPlayed = true;

    // log(isPlaying.toString());
    // log(player.isPlaying.value.toString() + ' is it bool or not');
  }
}
