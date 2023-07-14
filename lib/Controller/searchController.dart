import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:netflix_flutter/Models/genre.dart';
import 'package:netflix_flutter/Models/search.dart';

import '../Domain/domain.dart';

class SearchController extends GetxController {
  var isLoading = true.obs;
  var isMoreDataAvailable = false.obs;
  ScrollController searcScroll = ScrollController();
  String searchString = "";
  List searchList = [].obs;

  @override
  void onInit() {
    super.onInit();
    PaginateTask(searchString);
  }

  void PaginateTask(value) {
    searcScroll.addListener(() {
      if (searcScroll.position.pixels == searcScroll.position.maxScrollExtent) {
        print("reached End");
        fetchSeriesData(value);
      }
    });
  }

  fetchSeriesData(value) async {
    try {
      var resp = await RemoteServices.searchSeries(value);
      if (resp!.isNotEmpty) {
        isMoreDataAvailable(true);
      }
      searchList.addAll(resp[0].data!);
    } catch (exception) {
      isMoreDataAvailable(false);
    }
  }

  searchSeriesData(value) async {
    try {
      isLoading(true);

      var data = await RemoteServices.searchSeries(value);
      if (data != null) {
        // ignore: invalid_use_of_protected_member
        searchList.addAll(data[0].data!);
      }
    } finally {
      isLoading(false);
    }
  }
}
