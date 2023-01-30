import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get_it/get_it.dart';
import 'package:major_project/pages/drawer.dart';
import 'package:major_project/pages/genre.dart';
import 'package:major_project/pages/player.dart';
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
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 4.0),
            child: Text(
              "New Releases",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
          //CarouselSlider
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 240,
              width: screenwidth,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: CarouselSlider(
                  items: [
                    //musicList[index]['trackDetails']['coverArt']
                    song(musicList[17]['trackDetails']['coverArt'], screenwidth,
                        17),
                    song(musicList[5]['trackDetails']['coverArt'], screenwidth,
                        5),
                    song(musicList[11]['trackDetails']['coverArt'], screenwidth,
                        11),
                    song(musicList[8]['trackDetails']['coverArt'], screenwidth,
                        8),
                    song(musicList[6]['trackDetails']['coverArt'], screenwidth,
                        6),
                    song(musicList[7]['trackDetails']['coverArt'], screenwidth,
                        7),
                  ],
                  options: CarouselOptions(
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 500),
                    enlargeCenterPage: true,
                    aspectRatio: 9 / 16,
                    height: 250,
                    autoPlay: true,
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 4.0),
            child: Text(
              "Genre",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),
          // const SizedBox(
          //   height: 20,
          // ), //2nd part
          const GenreCard(),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 8, 8, 4.0),
            child: Text(
              "Featured Artist",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ),

          // Container(
          //   height: 80,
          //   color: Colors.amber,
          //   padding: const EdgeInsets.fromLTRB(0, 2, 5, 2),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Card(
          //           clipBehavior: Clip.antiAliasWithSaveLayer,
          //           child: const Image(
          //             image: AssetImage('images/me.png'),
          //             fit: BoxFit.fill,
          //           ),
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.circular(10)),
          //         ),
          //       ),
          //       Expanded(
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: const [
          //             Text(
          //               "If I can't have love, I want Power",
          //               overflow: TextOverflow.ellipsis,
          //               style: TextStyle(
          //                   fontSize: 15, fontWeight: FontWeight.w500),
          //               maxLines: 1,
          //             ),
          //             Text('Halsey')
          //           ],
          //         ),
          //       ),
          //       Expanded(
          //           child: Row(
          //         children: [
          //           Expanded(
          //             child: IconButton(
          //               icon: const Icon(Icons.skip_previous),
          //               onPressed: () {},
          //             ),
          //           ),
          //           Expanded(
          //             child: IconButton(
          //               icon: const Icon(Icons.pause),
          //               onPressed: () {},
          //             ),
          //           ),
          //           Expanded(
          //             child: IconButton(
          //               icon: const Icon(Icons.skip_next),
          //               onPressed: () {},
          //             ),
          //           )
          //         ],
          //       ))
          //     ],
          //   ),
          // )
        ],
      ),
      // bottomNavigationBar: const Controller(
      //     // songnumber: songsnumber,
      //     ),

      // GestureDetector(
      //   onTap: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: ((context) => Player(songnumber: songsnumber)),
      //       ),
      //     );
      //   },
      //   child: const Controller(
      //       // songnumber: songsnumber,
      //       ),
      // ),
    );
  }

  Widget song(String image, screenwidth, int src) {
    return GestureDetector(
      onTap: () {
        playerSeparate.open(src);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => Player(songnumber: src)),
          ),
        );
        // showDialog(
        //     context: context,
        //     builder: (context) => const AlertDialog(
        //           title: Text(
        //             "You can't play songs right now. If you want to know ask Kushal. Will be available soon.",
        //           ),
        //         ));
      },
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 350,
        width: screenwidth,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(11)),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: image,
          placeholder: (context, url) => const Image(
            image: AssetImage('images/cover.jpg'),
            fit: BoxFit.fill,
          ),
          errorWidget: (context, url, error) =>
              const Image(image: AssetImage('images/cover.jpg')),
        ),
        // Image(
        //   image: NetworkImage(image),
        //   // image: AssetImage(image),
        //   fit: BoxFit.fill,
        // ),
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