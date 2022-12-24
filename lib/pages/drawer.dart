import 'package:flutter/material.dart';
import 'package:major_project/pages/artist.dart';
import 'package:major_project/pages/homepage.dart';
import 'package:major_project/pages/listtileofsongs.dart';
import 'package:major_project/pages/trending.dart';

class DrawerList extends StatefulWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: [
          buildheader(),
          buildMenuItems(context),
        ],
      ),
    );
  }
}

Widget buildheader() => Column(
      children: const [
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547__340.jpg'),
              fit: BoxFit.cover,
            )),
            accountName: Text("Kushal Pangeni"),
            accountEmail: Text("kushalpangeni@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image(
                  image: AssetImage('images/Lord.jpg'),
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
            )),
      ],
    );

Widget buildMenuItems(context) => Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SafeArea(child: HomePage())));
          },
          hoverColor: Colors.red,
          leading: const Icon(
            Icons.home,
          ),
          title: const InkWell(
            child: Text("Home"),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.trending_up_outlined),
          title: const Text("Trending"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    const SafeArea(child: Trending('Lilith'))));
          },
        ),
        ListTile(
          leading: const Icon(Icons.explore),
          title: const Text("Explore"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    const SafeArea(child: Listtileofsongs())));
          },
        ),
        ListTile(
          leading: const Icon(Icons.music_note),
          title: const Text("New Releases"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.thumb_up),
          title: const Text("Made for You"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text("Artists"),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SafeArea(child: ArtistPage())));
          },
        ),
        ListTile(
          leading: const Icon(Icons.favorite_outline),
          title: const Text("Liked Songs"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text("Favourite Artist"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Settings"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Log Out"),
          onTap: () {},
        )
      ],
    );
