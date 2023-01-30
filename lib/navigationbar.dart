// import 'package:flutter/material.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';

// class NavBar extends StatefulWidget {
//   const NavBar({Key? key}) : super(key: key);

//   @override
//   State<NavBar> createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   AssetsAudioPlayer player = AssetsAudioPlayer();

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//             child: IconButton(
//                 onPressed: () {
//                   player.play();
//                 },
//                 icon: const Icon(Icons.play_arrow))),
//         Expanded(
//             child: IconButton(
//                 onPressed: () {
//                   player.pause();
//                 },
//                 icon: const Icon(Icons.pause)))
//       ],
//     );
//   }
// }
