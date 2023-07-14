import 'package:http/http.dart' as http;
import 'package:netflix_flutter/Models/genre.dart';
import 'package:netflix_flutter/Models/series.dart';

import '../Models/popularSeries.dart';
import '../Models/search.dart';
import '../Models/showRandom.dart';
import '../sharedPref.dart';

class RemoteServices {
//API Calling
//Search
// http://discoveryplus.herokuapp.com
  static Future<List<Search>?> searchSeries(value) async {
    String link =
        "${getCloudUrl()}/series/getSeriesSearchBySeriesName?column=id&skip=0&take=20&seriesName=$value";
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
      return searchFromJson(response.body);
    } else {
      //show error message
      return null;
    }
  }

  static Future<List<PopularSeries>?> fetchPopularSeries() async {
    String link = "${getCloudUrl()}/series/getTopTrendingTenSeries";
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
      return popularSeriesFromJson(response.body);
    } else {
      //show error message
      return null;
    }
  }

  static Future<List<Series>?> fetchSeries() async {
    String link = "${getCloudUrl()}/series?column=id&take=10";
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
      return seriesFromJson(response.body);
    } else {
      //show error message
      return null;
    }
  }

  static Future<List<ShowRandom>?> fetchRandom() async {
    String link = "${getCloudUrl()}/series/getTopTrendingOneSeries";
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
      return showRandomFromJson(response.body);
    } else {
      //show error message
      return null;
    }
  }

  /// list of Genre
  static Future<List<GenreModel>?> fetchData() async {
    String link = "${getCloudUrl()}/genre?column=id";
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
      return genreFromJson(response.body);
    } else {
      //show error message
      return null;
    }
  }
}
