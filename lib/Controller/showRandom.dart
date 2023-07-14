import 'package:get/state_manager.dart';
import 'package:netflix_flutter/Models/genre.dart';
import 'package:netflix_flutter/Models/showRandom.dart';

import '../Domain/domain.dart';

class ShowRandomController extends GetxController {
  var isLoading = true.obs;

  var showRandomList = <ShowRandom>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTags();
  }

  fetchTags() async {
    try {
      isLoading(true);
      var data = await RemoteServices.fetchRandom();
      if (data != null) {
        // ignore: invalid_use_of_protected_member
        showRandomList.value = data;
        print(showRandomList.value[0].image);
      }
    } finally {
      isLoading(false);
    }
  }
}
