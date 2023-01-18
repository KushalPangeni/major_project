import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:major_project/main.dart';
import 'package:major_project/player/endex.dart';
// import 'package:major_project/main.dart';
import 'package:major_project/player/playseparate.dart';

class Controller extends StatefulWidget {
  // final int songnumber;
  const Controller({
    super.key,
    // required this.songnumber,
  });

  // Controller.open(){}

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  final PlayerSeparate playerSeparate = GetIt.instance.get<PlayerSeparate>();
  Endex endex = Get.find<Endex>();
  @override
  void initState() {
    // songsname = widget.songnumber;
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
            Expanded(
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: const Image(
                  image: AssetImage('images/me.png'),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            //Song name and singer name
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "If I can't have love, I want Power",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    maxLines: 1,
                  ),
                  Text('Halsey')
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
                    icon: isPlayed
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow),
                    onPressed: () {
                      setState(
                        () {
                          if (isPlayed) {
                            playerSeparate.pausee();
                          } else {
                            // playerSeparate.open(songsnumber);
                            playerSeparate.playy();
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
