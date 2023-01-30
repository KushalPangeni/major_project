import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:major_project/pages/player.dart';
import 'package:major_project/player/playseparate.dart';
import 'package:major_project/songs.dart';

class GenrePage extends StatefulWidget {
  final String genre;
  const GenrePage({super.key, required this.genre});

  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  List musiclist = musicList;
  List<Map<dynamic, dynamic>> musicGenre = [];
  PlayerSeparate playerSeparate = GetIt.instance.get<PlayerSeparate>();

  Widget fillSongs(int index) {
    if (musiclist[index]['genre'] == widget.genre) {
      return ListTile(
        title: Text(musicList[index]['trackDetails']['title']),
        subtitle: Text(musicList[index]['artistsDetails']['name']),
        trailing: const Icon(Icons.favorite_outline),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) {
                return Player(
                  songnumber: index,
                );
              }),
            ),
          );
          playerSeparate.open(index);
        },
      );
    } else {
      return Container(
        color: Colors.amber,
        height: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.genre.toUpperCase())),
        body: ListView(
          children:
              List.generate(musicList.length, (index) => fillSongs(index)),
        ));
  }
}
