import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:major_project/songs.dart';

class PlayerSeparate {
  // final int source;
  List<Map> musiclist = musicList;
  final player = AssetsAudioPlayer();

  // PlayerSeparate();

  playy() {
    player.play();
    log('playy');
  }

  pausee() {
    player.pause();
    log('pausee');
  }

  void open(int source) {
    // player.stop();
    player.open(Audio(musicList[source]['trackDetails']['source']),
        autoStart: true, showNotification: true);
    log(player.isPlaying.value.toString() + ' is it bool or not');
  }
}
