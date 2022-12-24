import 'package:flutter/material.dart';
import 'package:major_project/drawer.dart';
import 'package:major_project/songs.dart';

class ArtistPage extends StatefulWidget {
  const ArtistPage({super.key});

  @override
  State<ArtistPage> createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> {
  List<Map> musiclist = musicList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(
          child: DrawerList(),
        ),
        appBar: AppBar(
          title: const Text("Artist Page"),
        ),
        body: GridView.count(
            mainAxisSpacing: 20,
            // crossAxisSpacing: ,
            crossAxisCount: 3,
            children: List.generate(
                musiclist.length,
                (index) => artist(musicList[index]['artistsDetails']['name'],
                    musicList[index]['artistsDetails']['profile'])))
        // ListView.builder(
        //   itemCount: musiclist.length,
        // itemBuilder: ((context, index) => artist(
        // musicList[index]['artistsDetails']['name'],
        // musicList[index]['artistsDetails']['profile'])),
        // ),
        );
  }

  Widget artist(String str, String img) {
    return InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(str),
                  ));
        },
        child: Card(
          child: Column(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(100)),
                child: Image(
                  image: NetworkImage(img),
                  fit: BoxFit.fill,
                ),
              ),
              Text(str)
            ],
          ),
        ));
  }
}
