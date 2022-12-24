// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';

import 'package:flutter/material.dart';

class Trending extends StatefulWidget {
  final String songName;
  // final String pathName;

  const Trending(this.songName);
  // const Trending({@required String? songName ,Key? key}) : super(key: key);

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  @override
  void initState() {
    super.initState();
    // if (songName = null) ? ' ': widget;
    //   // cache = AudioCache();

    //   // cache.load('song.mp3');
    //----------------
    // player.onPlayerStateChanged.listen((state) {
    //   setState(() {
    //     isPlaying = state == PlayerState.playing;
    //   });
    // });

    // //listen to audio duration
    // player.onDurationChanged.listen((newDuration) {
    //   setState(() {
    //     duration = newDuration;
    //   });
    // });
    // //listen to audio position
    // player.onPositionChanged.listen((newPosition) {
    //   setState(() {
    //     position = newPosition;
    //   });
    // });

    // setAudio();
    //----------------
  }

  // Future setAudio() async {
  //   DeviceFileSource(pathName);
  //   player.play(DeviceFileSource(pathName));
  //   isPlaying = true;
  // }

  @override
  Widget build(BuildContext context) {
    final double screenheight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;

    return Material(
      child: ListView(
        children: [
          SizedBox(
            height: screenheight,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Positioned(
                  // top: 0,
                  // left: 0,
                  child: Container(
                    //vitra ko sabai vanda tala ko
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(50),
                      color: Colors.blue[500], //Blue
                    ),
                    height: screenheight / 3,
                    width: screenwidth,
                  ),
                ),
                Positioned(
                    //transparent app bar
                    child: AppBar(
                  actions: const [Icon(Icons.search)],
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.menu)),
                )),
                Positioned(
                  //yellow thulo wala slider, player huni wala
                  top: screenheight / 7,
                  // left: 0,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          //space ho geet ko naam ko lagi
                          height: screenheight * 0.1,
                        ),
                        Flexible(
                          child: Text(
                            widget.songName,
                            style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Avenir',
                            ),
                          ),
                        ),
                        // MSlider(pathName)
                        //--------------
                        Slider(
                            min: 0,
                            max: duration.inSeconds.toDouble(),
                            value: position.inSeconds.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                // final position =
                                //     Duration(seconds: value.toInt());
                                // player.seek(position);
                                // changeToSeconds(value.toInt());
                                // value = value;
                              });
                            }),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Text(position.toString().split('.')[0]),
                              // Text((duration - position).toString().split('.')[0]),
                              //this upper one is so easy to make

                              Text(formatTime(position)),
                              Text(formatTime(duration - position))
                              // Text('$duration.')
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: IconButton(
                                      icon: const Icon(Icons.shuffle),
                                      onPressed: () {
                                        log('Shuffle');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                // color: Colors.amber,
                                height: 80,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: IconButton(
                                        icon: const Icon(Icons.skip_previous),
                                        onPressed: () {
                                          log('Previous');
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: CircleAvatar(
                                        maxRadius: 30,
                                        child: IconButton(
                                          icon: const Icon(Icons.pause),
                                          // iconSize: 20,
                                          onPressed: () {
                                            log('Pause');
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: IconButton(
                                        icon: const Icon(Icons.skip_next),
                                        onPressed: () {
                                          log('next');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.repeat),
                                onPressed: () {
                                  log('Repeat');
                                },
                              ),
                            ),
                          ],
                        ),

                        //--------------
                      ],
                    ),
                    // child: Text("${screenheight / 7}"),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.yellow,
                    ),
                    height: screenheight / 2.5,
                    width: screenwidth,
                  ),
                ),
                Positioned(
                  //Bich ko sano box ho
                  //circle avatar vako chahi
                  top: screenheight / 14,
                  right: (screenwidth - 150) / 2,
                  left: (screenwidth - 150) / 2,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: screenheight / 7,
                    // width: screenwidth / 3,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        // color: const Color(0x00f2e7d5),
                        // color: const Color.fromARGB(255, 245, 240, 230),
                        color: const Color.fromARGB(255, 238, 229, 229),
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 5, color: Colors.white),
                          color: Colors.amber,
                          // borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              image: AssetImage('images/me.png'),
                              fit: BoxFit.cover)),
                      // child: const Image(
                      //   image: AssetImage('images/me.png'),
                      //   height: 105,
                      //   width: 105,
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                  ),
                ),
                Text("$screenheight")
              ],
            ),
          ),
          // const SizedBox(height: 380, child: Music()),
        ],
      ),
    );
  }

  String formatTime(Duration duration) {
    String twoDigit(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigit(duration.inHours);
    final minutes = twoDigit(duration.inMinutes.remainder(60));
    final seconds = twoDigit(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}


// Slider(
//                             min: 0,
//                             max: duration.inSeconds.toDouble(),
//                             value: position.inSeconds.toDouble(),
//                             onChanged: (value) {
//                               setState(() {
//                                 // changeToSeconds(value.toInt());
//                                 // value = value;
//                               });
//                             }),
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // Text(_position.toString().split('.')[0]),
//                               // Text(_duration.toString().split('.')[0]),
//                               //this upper one is so easy to make

//                               Text(formatTime(position)),
//                               Text(formatTime(duration - position))
//                               // Text('$duration.')
//                             ],
//                           ),
//                         ),
//                         CircleAvatar(
//                           child: IconButton(
//                               onPressed: () {
//                                 setState(() {
//                                   // isPlaying = !isPlaying;
//                                   player.stop();
//                                 });
//                               },
//                               icon: Icon(
//                                   isPlaying ? Icons.play_arrow : Icons.pause)),
//                         )