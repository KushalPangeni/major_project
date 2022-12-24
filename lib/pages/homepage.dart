import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get_it/get_it.dart';
import 'package:major_project/player/assetaudio.dart';
import 'package:major_project/pages/drawer.dart';
import 'package:major_project/pages/genre.dart';
import 'package:major_project/player/playseparate.dart';
import 'package:major_project/songs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PlayerSeparate playerSeparate = GetIt.instance.get<PlayerSeparate>();
  List<Map> musiclist = musicList;
  @override
  Widget build(BuildContext context) {
    // final double screenheight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const Drawer(
        child: DrawerList(),
      ),
      appBar: AppBar(
        title: Row(
          // mainAxisAlignment: MainAxisAlignment,
          children: const [
            Expanded(
              child: Icon(Icons.music_note),
              flex: 1,
            ),
            Expanded(
              child: Text(
                "GeetSunam",
              ),
              flex: 9,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 240,
            width: screenwidth,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            child: CarouselSlider(
                items: [
                  //musicList[index]['trackDetails']['coverArt']
                  song(musicList[2]['trackDetails']['coverArt'], screenwidth),
                  song(musicList[5]['trackDetails']['coverArt'], screenwidth),
                  song(musicList[11]['trackDetails']['coverArt'], screenwidth),
                  song(musicList[8]['trackDetails']['coverArt'], screenwidth),
                  song(musicList[6]['trackDetails']['coverArt'], screenwidth),
                  song(musicList[7]['trackDetails']['coverArt'], screenwidth),
                ],
                options: CarouselOptions(
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  enlargeCenterPage: true,
                  aspectRatio: 9 / 16,
                  height: 250,
                  autoPlay: true,
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Genre",
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 30,
          ), //2nd part
          const GenreCard()
        ],
      ),
      bottomNavigationBar: const AssetsAudio(),
    );
  }

  Widget song(String image, screenwidth) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => const AlertDialog(
                  title: Text(
                    "You can't play songs right now. If you want to know ask Kushal. Will be available soon.",
                  ),
                ));
      },
      child: Container(
        height: 350,
        width: screenwidth,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(11)),
        child: Image(
          image: NetworkImage(image),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

// -----------------------------------------
// Container(
              //   height: 250,
              //   width: screenwidth,
              //   decoration: BoxDecoration(
              //       color: Colors.amber,
              //       borderRadius: BorderRadius.circular(11)),
              //   child: const Image(
              //     image: AssetImage('images/Lord.jpg'),
              //     fit: BoxFit.contain,
              //   ),
              // ),
              // const SizedBox(
              //   width: 5.0,
              // ),
              // Container(
              //   height: 250,
              //   width: screenwidth,
              //   decoration: BoxDecoration(
              //       color: Colors.amber,
              //       borderRadius: BorderRadius.circular(11)),
              //   child: const Image(
              //     image: AssetImage('images/me.png'),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              // const SizedBox(
              //   width: 5.0,
              // ),