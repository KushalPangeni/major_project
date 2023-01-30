import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:major_project/pages/player.dart';
import 'package:major_project/player/controller.dart';
import 'package:major_project/pages/drawer.dart';
import 'package:major_project/player/playseparate.dart';
import 'package:major_project/songs.dart';

class Listtileofsongs extends StatefulWidget {
  const Listtileofsongs({super.key});

  @override
  State<Listtileofsongs> createState() => _ListtileofsongsState();
}

class _ListtileofsongsState extends State<Listtileofsongs> {
  // Endex endex = Endex();
  int endex = 0;
  List<Map> musiclist = musicList;
  PlayerSeparate playerSeparate = GetIt.instance.get<PlayerSeparate>();
  @override
  void initState() {
    super.initState();
  }

  eindex(int a) {
    setState(() {
      // log(a.toString() + ' index');
      endex = a; //songnumber = endex
      // log(endex.toString() + ' endex value');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: DrawerList(),
      ),
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: ListView.builder(
        itemCount: musiclist.length,
        itemBuilder: ((context, index) => ListTile(
              title: Text(musicList[index]['trackDetails']['title']),
              subtitle: Text(musicList[index]['artistsDetails']['name']),
              trailing: const Icon(Icons.favorite_outline),
              onTap: () {
                setState(() {
                  eindex(index);
                  // index(endex);
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) {
                      return Player(
                        songnumber: endex,
                      );
                    }),
                  ),
                );
                playerSeparate.open(endex); //donot comment
                // context.read<PlayerSeparate>().open(endex);
              },
            )),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => Player(songnumber: endex)),
            ),
          );
        },
        child: Controller(
          songnumber: endex,
        ),
      ),
      // GestureDetector(
      //   onTap: () {
      //     // log('Tapped');
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: ((context) => Player(songnumber: endex)),
      //   ),
      // );
      //   },
      //   child: const Controller(
      //       // songnumber: songsnumber,
      //       ),
      // ),
    );
  }
}
