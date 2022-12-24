import 'dart:io';

import 'package:flutter/material.dart';

class Favoritesongs extends StatefulWidget {
  const Favoritesongs({Key? key}) : super(key: key);

  @override
  State<Favoritesongs> createState() => _FavoritesongsState();
}

class _FavoritesongsState extends State<Favoritesongs> {
  List<FileSystemEntity> songsFav = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: songsFav.length,
        itemBuilder: (context, index) {
          return songsFav.isNotEmpty
              ? const ListTile()
              : const Center(
                  child: Text('Loading'),
                );
        });
  }
}
