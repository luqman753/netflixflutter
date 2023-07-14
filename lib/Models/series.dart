// To parse this JSON data, do
//
//     final series = seriesFromJson(jsonString);

import 'dart:convert';

List<Series> seriesFromJson(String str) =>
    List<Series>.from(json.decode(str).map((x) => Series.fromJson(x)));

String seriesToJson(List<Series> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Series {
  Series({
    this.data,
    this.total,
  });

  List<Datum>? data;
  int? total;

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total,
      };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.storyline,
    this.genreId,
    this.rating,
    this.episodes,
    this.trailer,
    this.image,
    this.v,
    this.genres,
    this.casts,
    this.seasons,
  });

  Id? id;
  String? title;
  String? storyline;
  String? genreId;
  String? rating;
  String? episodes;
  String? trailer;
  String? image;
  int? v;
  Genres? genres;
  List<Cast>? casts;
  List<Season>? seasons;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: idValues.map![json["_id"]],
        title: json["title"],
        storyline: json["storyline"],
        genreId: json["genreId"],
        rating: json["rating"],
        episodes: json["episodes"],
        trailer: json["trailer"],
        image: json["image"],
        v: json["__v"],
        genres: Genres.fromJson(json["genres"]),
        casts: List<Cast>.from(json["casts"].map((x) => Cast.fromJson(x))),
        seasons:
            List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": idValues.reverse![id],
        "title": title,
        "storyline": storyline,
        "genreId": genreId,
        "rating": rating,
        "episodes": episodes,
        "trailer": trailer,
        "image": image,
        "__v": v,
        "genres": genres!.toJson(),
        "casts": List<dynamic>.from(casts!.map((x) => x.toJson())),
        "seasons": List<dynamic>.from(seasons!.map((x) => x.toJson())),
      };
}

class Cast {
  Cast({
    this.id,
    this.streamId,
    this.name,
    this.role,
    this.episodes,
    this.year,
    this.detail,
    this.v,
  });

  String? id;
  Id? streamId;
  String? name;
  String? role;
  String? episodes;
  String? year;
  String? detail;
  int? v;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        id: json["_id"],
        streamId: idValues.map![json["streamId"]],
        name: json["name"],
        role: json["role"],
        episodes: json["episodes"],
        year: json["year"],
        detail: json["detail"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "streamId": idValues.reverse![streamId],
        "name": name,
        "role": role,
        "episodes": episodes,
        "year": year,
        "detail": detail,
        "__v": v,
      };
}

enum Id {
  THE_630_C7_E16962_EA9_BC904_EFC66,
  THE_630_F4899_D500_E6_FAA3_F4_D622
}

final idValues = EnumValues({
  "630c7e16962ea9bc904efc66": Id.THE_630_C7_E16962_EA9_BC904_EFC66,
  "630f4899d500e6faa3f4d622": Id.THE_630_F4899_D500_E6_FAA3_F4_D622
});

class Genres {
  Genres({
    this.id,
    this.name,
    this.isActive,
    this.v,
  });

  String? id;
  String? name;
  bool? isActive;
  int? v;

  factory Genres.fromJson(Map<String, dynamic> json) => Genres(
        id: json["_id"],
        name: json["name"],
        isActive: json["isActive"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "isActive": isActive,
        "__v": v,
      };
}

class Season {
  Season({
    this.id,
    this.seriesId,
    this.season,
    this.name,
    this.image,
    this.v,
    this.epsiodes,
  });

  String? id;
  Id? seriesId;
  String? season;
  String? name;
  String? image;
  int? v;
  List<Epsiode>? epsiodes;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json["_id"],
        seriesId: idValues.map![json["seriesId"]],
        season: json["season"],
        name: json["name"],
        image: json["image"],
        v: json["__v"],
        epsiodes: List<Epsiode>.from(
            json["epsiodes"].map((x) => Epsiode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "seriesId": idValues.reverse![seriesId],
        "season": season,
        "name": name,
        "image": image,
        "__v": v,
        "epsiodes": List<dynamic>.from(epsiodes!.map((x) => x.toJson())),
      };
}

class Epsiode {
  Epsiode({
    this.id,
    this.seasonId,
    this.episode,
    this.title,
    this.description,
    this.url,
    this.v,
  });

  String? id;
  String? seasonId;
  String? episode;
  String? title;
  String? description;
  String? url;
  int? v;

  factory Epsiode.fromJson(Map<String, dynamic> json) => Epsiode(
        id: json["_id"],
        seasonId: json["seasonId"],
        episode: json["episode"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "seasonId": seasonId,
        "episode": episode,
        "title": title,
        "description": description,
        "url": url,
        "__v": v,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
