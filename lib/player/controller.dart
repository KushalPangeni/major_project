import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:major_project/main.dart';
import 'package:major_project/player/playseparate.dart';
import 'package:major_project/songs.dart';

class Controller extends StatefulWidget {
  final int songnumber;
  const Controller({
    super.key,
    required this.songnumber,
  });

  // Controller.open(){}

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  final PlayerSeparate playerSeparate = GetIt.instance.get<PlayerSeparate>();
  List musiclist = musicList;

  @override
  void initState() {
    songsnumber = widget.songnumber;
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(7)),
        height: 70,
        padding: const EdgeInsets.fromLTRB(0, 2, 5, 2),
        child: Row(
          children: [
            //Image container
            Container(
              height: 60,
              width: 90,
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(16)),
              child: const Image(
                image: AssetImage('images/cover.jpg'),
                fit: BoxFit.contain,
              ),
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10)),
            ),
            //Song name and singer name
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    musiclist[songsnumber]['trackDetails']['title'],
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                    maxLines: 1,
                  ),
                  const Text('Halsey')
                ],
              ),
            ),
            //Row of icon button previous pause next
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.skip_previous),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: playerSeparate.player.playing
                        // isPlayed
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow),
                    onPressed: () {
                      setState(
                        () {
                          if (playerSeparate.player.playing) {
                            playerSeparate.player.pause();
                          } else {
                            // playerSeparate.open(songsnumber);
                            playerSeparate.player.play();
                          }
                        },
                      );
                      // IconButton(
                      //   icon: playerSeparate.isPlaying
                      //       ? const Icon(Icons.pause)
                      //       : const Icon(Icons.play_arrow),
                      //   onPressed: () {
                      //     setState(
                      //       () {
                      //         if (playerSeparate.isPlaying) {
                      //           playerSeparate.pausee();
                      //         } else {
                      //           // playerSeparate.open(songsnumber);
                      //           playerSeparate.playy();
                      //         }
                      //       },
                      //     );
                      // playerSeparate.playy();
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: const Icon(Icons.skip_next),
                    onPressed: () {},
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
