// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

List<Search> searchFromJson(String str) =>
    List<Search>.from(json.decode(str).map((x) => Search.fromJson(x)));

String searchToJson(List<Search> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Search {
  Search({
    this.data,
    this.total,
  });

  List<Datum>? data;
  int? total;

  factory Search.fromJson(Map<String, dynamic> json) => Search(
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

  StreamIdEnum? id;
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
        id: streamIdEnumValues.map![json["_id"]],
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
        "_id": streamIdEnumValues.reverse![id],
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
  StreamIdEnum? streamId;
  String? name;
  String? role;
  String? episodes;
  String? year;
  String? detail;
  int? v;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        id: json["_id"],
        streamId: streamIdEnumValues.map![json["streamId"]],
        name: json["name"],
        role: json["role"],
        episodes: json["episodes"],
        year: json["year"],
        detail: json["detail"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "streamId": streamIdEnumValues.reverse![streamId],
        "name": name,
        "role": role,
        "episodes": episodes,
        "year": year,
        "detail": detail,
        "__v": v,
      };
}

enum StreamIdEnum {
  THE_6315_E330_CEFE5_AD51_F6_A1_A41,
  THE_63188903_CEFE5_AD51_F6_A3730
}

final streamIdEnumValues = EnumValues({
  "6315e330cefe5ad51f6a1a41": StreamIdEnum.THE_6315_E330_CEFE5_AD51_F6_A1_A41,
  "63188903cefe5ad51f6a3730": StreamIdEnum.THE_63188903_CEFE5_AD51_F6_A3730
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

  SeasonIdEnum? id;
  StreamIdEnum? seriesId;
  String? season;
  String? name;
  String? image;
  int? v;
  List<Epsiode>? epsiodes;

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: seasonIdEnumValues.map![json["_id"]],
        seriesId: streamIdEnumValues.map![json["seriesId"]],
        season: json["season"],
        name: json["name"],
        image: json["image"],
        v: json["__v"],
        epsiodes: List<Epsiode>.from(
            json["epsiodes"].map((x) => Epsiode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": seasonIdEnumValues.reverse![id],
        "seriesId": streamIdEnumValues.reverse![seriesId],
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
  SeasonIdEnum? seasonId;
  String? episode;
  String? title;
  String? description;
  String? url;
  int? v;

  factory Epsiode.fromJson(Map<String, dynamic> json) => Epsiode(
        id: json["_id"],
        seasonId: seasonIdEnumValues.map![json["seasonId"]],
        episode: json["episode"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "seasonId": seasonIdEnumValues.reverse![seasonId],
        "episode": episode,
        "title": title,
        "description": description,
        "url": url,
        "__v": v,
      };
}

enum SeasonIdEnum {
  THE_6315_E366_CEFE5_AD51_F6_A1_A67,
  THE_6315_E37_BCEFE5_AD51_F6_A1_A75,
  THE_63188937_CEFE5_AD51_F6_A3756,
  THE_6318894_DCEFE5_AD51_F6_A3770,
  THE_63188960_CEFE5_AD51_F6_A3786,
  THE_63188973_CEFE5_AD51_F6_A379_C,
  THE_63188986_CEFE5_AD51_F6_A37_B2,
  THE_6318899_CCEFE5_AD51_F6_A37_CA
}

final seasonIdEnumValues = EnumValues({
  "6315e366cefe5ad51f6a1a67": SeasonIdEnum.THE_6315_E366_CEFE5_AD51_F6_A1_A67,
  "6315e37bcefe5ad51f6a1a75": SeasonIdEnum.THE_6315_E37_BCEFE5_AD51_F6_A1_A75,
  "63188937cefe5ad51f6a3756": SeasonIdEnum.THE_63188937_CEFE5_AD51_F6_A3756,
  "6318894dcefe5ad51f6a3770": SeasonIdEnum.THE_6318894_DCEFE5_AD51_F6_A3770,
  "63188960cefe5ad51f6a3786": SeasonIdEnum.THE_63188960_CEFE5_AD51_F6_A3786,
  "63188973cefe5ad51f6a379c": SeasonIdEnum.THE_63188973_CEFE5_AD51_F6_A379_C,
  "63188986cefe5ad51f6a37b2": SeasonIdEnum.THE_63188986_CEFE5_AD51_F6_A37_B2,
  "6318899ccefe5ad51f6a37ca": SeasonIdEnum.THE_6318899_CCEFE5_AD51_F6_A37_CA
});

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
