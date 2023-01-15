import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:major_project/pages/drawer.dart';
import 'package:major_project/player/playseparate.dart';
import 'package:major_project/songs.dart';

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
            icon: const Icon(Icons.arrow_downward),
            color: Colors.black,
            onPressed: () {},
          ),
          actions: [
            IconButton(
              onPressed: () {},
              color: Colors.black,
              icon: const Icon(Icons.padding),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
              color: Colors.black,
            )
          ],
        ),
        drawer: const Drawer(
          backgroundColor: Colors.black,
          child: DrawerList(),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Column(
            children: [
              Container(
                height: 300,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image(
                  // image: AssetImage('images/Pop.jpg'),
                  image: NetworkImage(
                      musiclist[songsnumber]['trackDetails']['coverArt']),
                  // fit: BoxFit.cover,
                  fit: BoxFit.fill,
                ),
              ),
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
              Slider(
                min: 0,
                max: 1,
                value: 0.2,
                onChanged: ((value) {
                  setState(() {
                    log('value');
                  });
                }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("00:00"),
                    Text("04:52"),
                    // Text(playerSeparate.durationn),
                  ],
                ),
              ),
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
                        icon: playerSeparate.isPlaying
                            ? const Icon(Icons.pause)
                            : const Icon(Icons.play_arrow),
                        onPressed: () {
                          setState(() {
                            if (playerSeparate.isPlaying) {
                              playerSeparate.pausee();
                            } else {
                              playerSeparate.playy();
                            }
                          });
                          // playerSeparate.playy();
                        },
                      ),
                      IconButton(
                        onPressed: () {},
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
        ),
      ),
    );
  }
}
