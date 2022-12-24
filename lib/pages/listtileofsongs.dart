import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:major_project/player/assetaudio.dart';
import 'package:major_project/pages/drawer.dart';
import 'package:major_project/player/playseparate.dart';
import 'package:major_project/songs.dart';

class Listtileofsongs extends StatefulWidget {
  const Listtileofsongs({super.key});

  @override
  State<Listtileofsongs> createState() => _ListtileofsongsState();
}

class _ListtileofsongsState extends State<Listtileofsongs> {
  int endex = 0;
  List<Map> musiclist = musicList;
  PlayerSeparate playerSeparate = GetIt.instance.get<PlayerSeparate>();
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
                  log('$index tapped');
                  playerSeparate.open(endex);
                },
              ))),
      bottomNavigationBar: const AssetsAudio(),
    );
  }
}
