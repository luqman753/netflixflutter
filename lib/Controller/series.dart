import 'package:get/state_manager.dart';
import 'package:netflix_flutter/Models/series.dart';

import '../Domain/domain.dart';

class SeriesController extends GetxController {
  var isLoading = true.obs;

  var seriesList = <Series>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSeriesController();
  }

  fetchSeriesController() async {
    try {
      isLoading(true);
      var data = await RemoteServices.fetchSeries();
      if (data != null) {
        // ignore: invalid_use_of_protected_member
        seriesList.value = data;
      }
    } finally {
      isLoading(false);
    }
  }
}
