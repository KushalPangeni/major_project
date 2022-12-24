import 'dart:developer';

import 'package:flutter/material.dart';
// import 'package:major_project/homepage.dart';

void main() {
  log('main');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        primarySwatch: Colors.green,
        backgroundColor: Colors.orange,
      ),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.orange[200],
          // drawer: const Drawer(
          //   child: DrawerList(),
          // ),
          // appBar: AppBar(
          //   title: Row(
          //     // mainAxisAlignment: MainAxisAlignment,
          //     children: const [
          //       Expanded(
          //         child: Icon(Icons.music_note),
          //         flex: 1,
          //       ),
          //       Expanded(
          //         child: Text(
          //           "GeetSunam",
          //         ),
          //         flex: 9,
          //       )
          //     ],
          //   ),
          // ),
          // body: const HomePage(),
          // bottomNavigationBar: const AssetsAudio(
          //   source: 'songs/FarrukoPepas.mp3.mp3',
          // )
        ),
      ),
    );
  }
}
