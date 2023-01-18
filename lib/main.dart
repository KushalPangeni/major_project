import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:major_project/pages/homepage.dart';
import 'package:major_project/player/endex.dart';
import 'package:major_project/player/playseparate.dart';
import 'package:provider/provider.dart';

void main() {
  //creating PlayerSeparate Class as singleton by using GetIt package
  final GetIt getIt = GetIt.instance;
  getIt.registerLazySingleton(() => PlayerSeparate());
  log('main');
  runApp(Provider(create: (context) => PlayerSeparate(), child: MyApp()));
}

int songsnumber = 0;
bool isPlayed = false;

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  final Endex endex = Get.put(Endex());

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
          body: const HomePage(),
        ),
      ),
    );
  }
}
