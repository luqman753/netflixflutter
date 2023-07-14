import 'package:flutter/material.dart';
import 'package:netflix_flutter/pages/home_page.dart';
import 'package:netflix_flutter/pages/root_app.dart';
import 'package:netflix_flutter/pages/splashScreen.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SplashScreen()
      // RootApp(),
      ));
}
