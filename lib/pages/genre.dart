import 'package:flutter/material.dart';
import 'package:major_project/pages/genre_page.dart';

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
          card('Pop', 'images/Pop.jpg', 'pop'),
          card('Classical', 'images/placeholder-image.jpg', 'Classical'),
          card('Rock', 'images/placeholder-image.jpg', 'Rock'),
          card('Dohori', 'images/dohori.jpg', 'Dohori'),
          card('Teej', 'images/teej.png', 'Teej'),
          card('Adhunik', 'images/placeholder-image.jpg', 'Adhunik'),
          card('Gajal', 'images/placeholder-image.jpg', 'Gajal'),
          card('Hiphop', 'images/placeholder-image.jpg', 'Hiphop'),
        ],
      ),
    );
  }

  Widget card(String genre, String img, String genree) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: ((context) => GenrePage(genre: genree))));
      },
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
