import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:netflix_flutter/Models/genre.dart';
import 'package:netflix_flutter/Models/popularSeries.dart';

import '../Domain/domain.dart';

class PopularController extends GetxController {
  var isLoading = true.obs;
  var moreLoading = true.obs;
  ScrollController controller = ScrollController();

 var popularSeriesList = <PopularSeries>[].obs;
  // <PopularSeries>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPopularSeries();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        updateList();
      }
    });
  }

  updateList() async {
    try {
      moreLoading(true);
      var data = await RemoteServices.fetchPopularSeries();
      if (data != null) {
        // popularSeriesList.clear();
        popularSeriesList.addAll(data);
        print(popularSeriesList);

        moreLoading(false);
      }
    } finally {}
  }

  fetchPopularSeries() async {
    try {
      isLoading(true);
      var data = await RemoteServices.fetchPopularSeries();
      if (data != null) {
        // ignore: invalid_use_of_protected_member
        popularSeriesList.value=data;
      
      }
    } finally {
      isLoading(false);
    }
  }
}
