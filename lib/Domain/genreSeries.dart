// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:netflix_flutter/Models/genreSeries.dart';
import 'package:http/http.dart' as http;

import '../sharedPref.dart';

class RemoteServices2 {
  static Future<List<GenreSeries>?> genreSeries(id) async {
    String link =
        "${getCloudUrl()}/series/getTopTrendingSeriesOnGenreBase?column=id&skip=0&take=20&genreId=6315e32fcefe5ad51f6a1a3f";

    // 630ef2936fac5ef451fcb5b9";
    var url = Uri.parse(link);
    var response = await http.get(
      url,
      headers: {
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2MzdkYmYxYWIwNWZlOTkwM2IyNTk4NGUiLCJ0eXBlIjoiQUNDRVNTX1RPS0VOIiwicm9sZSI6IkFETUlOIiwiaWF0IjoxNjY5MTg1MzE2fQ.JYiXhl20L3gg0tnQzQCvCSu-imxthfpYpmvOOrdwXBU",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      return genreSeriesFromJson(response.body);
    } else {
      //show error message
      return null;
    }
  }

  ///

  ///
}
