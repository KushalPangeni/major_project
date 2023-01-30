import 'dart:developer';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:major_project/pages/drawer.dart';
import 'package:major_project/player/playseparate.dart';
import 'package:major_project/player/position_data.dart';
import 'package:major_project/songs.dart';
import 'package:rxdart/rxdart.dart';

class Player extends StatefulWidget {
  final int songnumber;
  const Player({super.key, required this.songnumber});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  final PlayerSeparate playerSeparate = GetIt.instance.get<PlayerSeparate>();
  List<Map> musiclist = musicList;
  late int songsnumber;

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          playerSeparate.player.positionStream,
          playerSeparate.player.bufferedPositionStream,
          playerSeparate.player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));
  @override
  void initState() {
    songsnumber = widget.songnumber;
    super.initState();
    setState(() {
      // playerSeparate.open(songsnumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.teal[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_down),
            color: Colors.black,
            onPressed: () {},
          ),
          actions: [
            IconButton(
              onPressed: () {
                log('padding');
              },
              color: Colors.black,
              icon: const Icon(Icons.padding),
            ),
            IconButton(
              onPressed: () {
                log('Share');
              },
              icon: const Icon(Icons.share),
              color: Colors.black,
            )
          ],
        ),
        drawer: const Drawer(
          backgroundColor: Colors.black,
          child: DrawerList(),
        ),
        body: StreamBuilder<PositionData>(
            stream: _positionDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return Padding(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: musiclist[songsnumber]['trackDetails']
                            ['coverArt'],
                        placeholder: (context, url) => const Image(
                          image: AssetImage('images/cover.jpg'),
                          fit: BoxFit.fill,
                        ),
                        errorWidget: (context, url, error) =>
                            const Image(image: AssetImage('images/cover.jpg')),
                      ),
                      // Image(
                      //   // image: AssetImage('images/Pop.jpg'),
                      //   image: NetworkImage(
                      //       musiclist[songsnumber]['trackDetails']['coverArt']),
                      //   // fit: BoxFit.cover,
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                    //Song name and artist name
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 15),
                      child: Column(
                        children: [
                          Text(
                            musiclist[songsnumber]['trackDetails']['title'],
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            musiclist[songsnumber]['artistsDetails']['name'],
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //ProgressBar
                    ProgressBar(
                      progress: positionData?.position ?? Duration.zero,
                      buffered: positionData?.bufferedPosition ?? Duration.zero,
                      total: positionData?.duration ?? Duration.zero,
                      onSeek: playerSeparate.player.seek,
                    ),
                    // Slider(
                    //   min: 0,
                    //   max: playerSeparate.player.duration == null
                    //       ? 0
                    //       : playerSeparate.player.duration!.inSeconds.toDouble(),
                    //   value: 0.2,
                    //   onChanged: ((value) {
                    //     setState(() {
                    //       log('value');
                    //     });
                    //   }),
                    // ),
                    //Time for player
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: const [
                    //       Text("00:00"),
                    //       Text("04:52"),
                    //       // Text(playerSeparate.durationn),
                    //     ],
                    //   ),
                    // ),
                    //Icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shuffle),
                          iconSize: 40,
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.skip_previous),
                              iconSize: 40,
                            ),
                            IconButton(
                              iconSize: 55,
                              icon: playerSeparate.player.playing
                                  ? const Icon(Icons.pause)
                                  : const Icon(Icons.play_arrow),
                              onPressed: () {
                                setState(() {
                                  if (playerSeparate.player.playing) {
                                    playerSeparate.player.pause();
                                  } else {
                                    // playerSeparate.player.open();
                                    playerSeparate.player.play();
                                  }
                                });
                                // playerSeparate.playy();
                              },
                            ),
                            IconButton(
                              onPressed: () {
                                playerSeparate.player.seekToNext();
                              },
                              icon: const Icon(Icons.skip_next),
                              iconSize: 40,
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.repeat),
                          iconSize: 40,
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
