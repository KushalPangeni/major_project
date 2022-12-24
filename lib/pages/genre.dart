import 'package:flutter/material.dart';

class GenreCard extends StatefulWidget {
  const GenreCard({super.key});

  @override
  State<GenreCard> createState() => _GenreCardState();
}

class _GenreCardState extends State<GenreCard> {
  // List<String> genre = [
  //   'Pop',
  //   'Classical',
  //   'Rock',
  //   'Dohori',
  //   'Teej',
  //   'Adhunik',
  //   'Gajal',
  //   'Hiphop'
  // ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      // width: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          card('Pop', 'images/Pop.jpg'),
          card('Classical', 'images/placeholder-image.jpg'),
          card('Rock', 'images/placeholder-image.jpg'),
          card('Dohori', 'images/dohori.jpg'),
          card('Teej', 'images/teej.png'),
          card('Adhunik', 'images/placeholder-image.jpg'),
          card('Gajal', 'images/placeholder-image.jpg'),
          card('Hiphop', 'images/placeholder-image.jpg'),
        ],
      ),
    );
  }

  Widget card(String genre, String img) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 100,
        width: 100,
        child: Card(
          child: Column(
            children: [
              Image(
                height: 76,
                image: AssetImage(img),
                fit: BoxFit.contain,
              ),
              Text(genre)
            ],
          ),
        ),
      ),
    );
  }
}
