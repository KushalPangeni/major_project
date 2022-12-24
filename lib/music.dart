import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:major_project/trending.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Music extends StatefulWidget {
  // const Music({super.key});
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  List<FileSystemEntity> songs = [];
  List<FileSystemEntity> songsFav = [];

  final player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    // final player = AudioPlayer();

    getSongs();
  }

  getSongs() async {
    await Permission.storage.request();
    if (await Permission.storage.isGranted == true) {
      // final directory = await getExternalStorageDirectory();
      // log(directory.toString());

      // String mp3Path = dir.toString();
      // log(mp3Path);
      // var data = directory.toString().split("/");
      // List<String> dd = [];
      // for (var d in data) {
      //   if (d != "Android") {
      //     dd.add(d);
      //   } else {
      //     break;
      //   }
      // }
      // Directory dir = Directory(dd.join("/"));
      Directory dir = Directory('/storage/emulated/0/songs');
      log(dir.path);
      log('$duration');
      List<FileSystemEntity> files;
      files = dir.listSync(recursive: true, followLinks: false);
      // log(files[0].toString());
      for (FileSystemEntity entity in files) {
        String path = entity.path;
        if (path.endsWith('.mp3')) songs.add(entity);
      }
      log(songs.toString());
      log(songs.length.toString());
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // final alreadySaved = songsFav.contains(songs[index]);

    return Scaffold(
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return songs.isNotEmpty
              ? ListTile(
                  onTap: () async {
                    // if (isPlaying)
                    String title =
                        songs[index].path.split("/").last.split(".")[0];
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            Trending(title, songs[index].path)));
                    // player.playing == true ? player.stop() : player.play;
                    // player.setFilePath(songs[index].path);
                    // log('${player.setFilePath(songs[index].path)}');
                    // log('123');
                    // player.setUrl(
                    //   '$songs[index].path',
                    // );

                    setState(() {
                      Trending(title.toString(), songs[index].path);
                      // player.playing == true ? player.stop() : player.play();
                    });
                    // player.duration

                    // player.play();

                    log(songs[index].path);
                    log(songs[index].path.split('/').last);
                    // var location = log(songs[index].path);
                    // var duration = await player.setFilePath(location);
                    log("$duration");
                    log(songs[index].path.split('/').last.split('.')[0]);
                    log('music.dart');
                  },
                  // Trending(title),
                  title: Text('${index + 1}  ' +
                      songs[index].path.split("/").last.split(".")[0]),
                  trailing: IconButton(
                    icon: const Icon(Icons.favorite),
                    onPressed: () {
                      // setState(() {
                      //   if (alreadySaved) {
                      //     songsFav.remove(songs[index]);
                      //   } else {
                      //     songsFav.add(songs[index]);
                      //   }
                      // });
                    },
                  ),
                )
              : const Center(
                  child: Text("Loading..."),
                );
        },
      ),
    );
  }
}
