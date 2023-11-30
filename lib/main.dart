import 'package:flutter/material.dart';
import 'package:movie_search/screens/details.dart';
import 'package:movie_search/screens/home.dart';
import 'package:movie_search/screens/search.dart';
import 'package:movie_search/screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: Home.id,
      routes: {
        Splash.id: (context) => Splash(),
        Search.id: (context) => Search(),
        Details.id: (context) => Details(),
        Home.id: (context) => Home(),
      },
    );
  }
}
