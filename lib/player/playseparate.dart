import 'dart:developer';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:major_project/songs.dart';

class PlayerSeparate {
  // final int source;
  List<Map> musiclist = musicList;
  final player = AssetsAudioPlayer();

  // PlayerSeparate();
  // durationCurrent() {
  //   final durationn = player.current.value.duration;
  // }

  playy() {
    player.play();
    log('playy');
  }

  pausee() {
    player.pause();
    log('pausee');
  }

  void open(int source) {
    log("message");
    // log(player.current.value!.audio.duration.toString().split('.')[0]);
    // player.stop();
    player.open(
      Audio(musicList[source]['trackDetails']['source']),
      autoStart: true, showNotification: true,
      // notificationSettings: NotificationSettings(
      //   customPlayIcon: AndroidResDrawable(name: '')
      // )
    );
    log(player.isPlaying.value.toString() + ' is it bool or not');
  }
}
