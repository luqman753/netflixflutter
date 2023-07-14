import 'package:get/state_manager.dart';
import 'package:netflix_flutter/Models/genre.dart';

import '../Domain/domain.dart';

class GenreController extends GetxController {
  var isLoading = true.obs;

  var genreList = <GenreModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTags();
  }

  fetchTags() async {
    try {
      isLoading(true);
      var data = await RemoteServices.fetchData();
      if (data != null) {
        // ignore: invalid_use_of_protected_member
        genreList.value = data;
        print(genreList.value[0].data![0].name);
      }
    } finally {
      isLoading(false);
    }
  }
}
