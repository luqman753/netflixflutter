import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:netflix_flutter/Models/genreSeries.dart';

import '../Domain/genreSeries.dart';

class GenreSeriesController extends GetxController {
  var isLoading = true.obs;
  var isMoreDataAvailable = true.obs;
  ScrollController genreSeriesScroll = ScrollController();
  List genreSeriesList = [].obs;
  // var genreSeriesList = <GenreSeries>[].obs;
  var page = 20;
  @override
  void onInit() {
    super.onInit();
    // PaginateTask();
  }

  void PaginateTask(id) {
    if (genreSeriesList.isEmpty) {
      // page += 20;
      fetchSeriesData(id);
    }
    genreSeriesScroll.addListener(() {
      if (genreSeriesScroll.position.pixels ==
          genreSeriesScroll.position.maxScrollExtent) {
        print("reached End");
        page += 20;
        fetchPaginatedData(id, page);
      }
    });
  }

  fetchPaginatedData(id, page) async {
  

    try {
      var resp = await RemoteServices2.genreSeries(id);
      if (resp!.isNotEmpty) {
        isMoreDataAvailable(true);
      }
      genreSeriesList.addAll(resp[0].series!);
    } catch (exception) {
      isMoreDataAvailable(false);
    }
  }

  fetchSeriesData(id) async {
    try {
      isLoading(true);
      var resp = await RemoteServices2.genreSeries(id);
      if (resp != null) {
        genreSeriesList.addAll(resp[0].series!);
      }
    } finally {
      // isMoreDataAvailable(false);
      isLoading(false);
    }
  }
}
