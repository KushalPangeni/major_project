// import 'dart:io';

// import 'package:flutter/material.dart';

// class Favoritesongs extends StatefulWidget {
//   const Favoritesongs({Key? key}) : super(key: key);

//   @override
//   State<Favoritesongs> createState() => _FavoritesongsState();
// }

// class _FavoritesongsState extends State<Favoritesongs> {
//   List<FileSystemEntity> songsFav = [];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: songsFav.length,
//         itemBuilder: (context, index) {
//           return songsFav.isNotEmpty
//               ? const ListTile()
//               : const Center(
//                   child: Text('Loading'),
//                 );
//         });
//   }
// }
// Playing{audio: PlayingAudio{
//   audio: Audio{
//     path: songs/music6.mp3, 
//     package: null, 
//     audioType: AudioType.asset, 
//     _metas: Instance of 'Metas', 
//     _networkHeaders: null}, 
//   duration: 0:05:03.670000}, 
//   index: 0, 
//   hasNext: false, 
//   playlist: ReadingPlaylist{
//     audios: [Audio{path: songs/music6.mp3, package: null, audioType: AudioType.asset, _metas: Instance of 'Metas', _networkHeaders: null}], currentIndex: 0}}