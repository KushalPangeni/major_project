import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:major_project/drawer.dart';
import 'package:major_project/genre.dart';
// import 'package:major_project/assetaudio.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  song(
                      'https://img.youtube.com/vi/fUk527d7LFU/maxresdefault.jpg',
                      screenwidth),
                  song(
                      'https://img.youtube.com/vi/RHU1bvWZavY/maxresdefault.jpg',
                      screenwidth),
                  song(
                      'https://img.youtube.com/vi/ZyCUcOFzH7w/maxresdefault.jpg',
                      screenwidth),
                  song(
                      'https://img.youtube.com/vi/ooMeMvww2oA/maxresdefault.jpg',
                      screenwidth),
                  song(
                      'https://img.youtube.com/vi/gkq4sOmjWXY/maxresdefault.jpg',
                      screenwidth),
                  song(
                      'https://img.youtube.com/vi/OlYoCjUGPJ4/maxresdefault.jpg',
                      screenwidth),
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