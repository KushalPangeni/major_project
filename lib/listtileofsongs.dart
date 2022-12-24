import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:major_project/assetaudio.dart';
import 'package:major_project/drawer.dart';
import 'package:major_project/playseparate.dart';
import 'package:major_project/songs.dart';

class Listtileofsongs extends StatefulWidget {
  const Listtileofsongs({super.key});

  @override
  State<Listtileofsongs> createState() => _ListtileofsongsState();
}

class _ListtileofsongsState extends State<Listtileofsongs> {
  int endex = 0;
  List<Map> musiclist = musicList;
  @override
  void initState() {
    super.initState();
  }

  eindex(int a) {
    setState(() {
      log(a.toString() + ' index');
      endex = a;
      log(endex.toString() + ' endex value');
    });
  }

  void callAudio(int endex) {
    AssetsAudio(
      source: musicList[endex]['trackDetails']['source'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: DrawerList(),
      ),
      appBar: AppBar(title: const Text('Explore')),
      body: ListView.builder(
          itemCount: musiclist.length,
          itemBuilder: ((context, index) => ListTile(
                title: Text(musicList[index]['trackDetails']['title']),
                subtitle: Text(musicList[index]['artistsDetails']['name']),
                onTap: () {
                  setState(() {
                    eindex(index);
                  });
                  AssetsAudio(
                    source: endex,
                  );
                  log('$index tapped');
                  PlayerSeparate().open(endex);
                },
              ))),
      bottomNavigationBar: AssetsAudio(
        source: endex,
      ),
    );
  }
}
