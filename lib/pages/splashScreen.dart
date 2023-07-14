import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:netflix_flutter/pages/home_page.dart';

import '../Controller/genre.dart';
import '../Controller/popularSeries.dart';
import '../Controller/series.dart';
import '../Controller/showRandom.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final GenreController genreData = Get.put(GenreController());
  // // final PopularController popularController = Get.put(PopularController());
  // final ShowRandomController showRandom = Get.put(ShowRandomController());
  // final SeriesController seriesData = Get.put(SeriesController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            child: Image.asset("assets/images/4.png", height: 140, width: 140),
          ),
        ));
  }
}
