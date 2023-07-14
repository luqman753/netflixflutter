// To parse this JSON data, do
//
//     final genreSeries = genreSeriesFromJson(jsonString);

import 'dart:convert';

List<GenreSeries> genreSeriesFromJson(String str) => List<GenreSeries>.from(
    json.decode(str).map((x) => GenreSeries.fromJson(x)));

String genreSeriesToJson(List<GenreSeries> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GenreSeries {
  GenreSeries({
    this.series,
    this.total,
  });

  List<Series>? series;
  int? total;

  factory GenreSeries.fromJson(Map<String, dynamic> json) => GenreSeries(
        series:
            List<Series>.from(json["series"].map((x) => Series.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "series": List<dynamic>.from(series!.map((x) => x.toJson())),
        "total": total,
      };
}

class Series {
  Series({
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
  List<Genre>? genres;
  List<Cast>? casts;
  List<Season>? seasons;

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        id: streamIdEnumValues.map![json["_id"]],
        title: json["title"],
        storyline: json["storyline"],
        genreId: json["genreId"],
        rating: json["rating"],
        episodes: json["episodes"],
        trailer: json["trailer"],
        image: json["image"],
        v: json["__v"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
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
        "genres": List<dynamic>.from(genres!.map((x) => x.toJson())),
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
  Role? role;
  Episodes? episodes;
  String? year;
  String? detail;
  int? v;

  factory Cast.fromJson(Map<String, dynamic> json) => Cast(
        id: json["_id"],
        streamId: streamIdEnumValues.map![json["streamId"]],
        name: json["name"],
        role: roleValues.map![json["role"]],
        episodes: episodesValues.map![json["episodes"]],
        year: json["year"],
        detail: json["detail"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "streamId": streamIdEnumValues.reverse![streamId],
        "name": name,
        "role": roleValues.reverse![role],
        "episodes": episodesValues.reverse![episodes],
        "year": year,
        "detail": detail,
        "__v": v,
      };
}

enum Episodes { THE_78_EPISODES, THE_1_EPISODE }

final episodesValues = EnumValues({
  "1 episode": Episodes.THE_1_EPISODE,
  "78 episodes": Episodes.THE_78_EPISODES
});

enum Role { SELF, SELF_FAN_OF_BEAR }

final roleValues = EnumValues(
    {"Self": Role.SELF, "Self - Fan of Bear": Role.SELF_FAN_OF_BEAR});

enum StreamIdEnum { THE_630_EF2936_FAC5_EF451_FCB5_BB }

final streamIdEnumValues = EnumValues({
  "630ef2936fac5ef451fcb5bb": StreamIdEnum.THE_630_EF2936_FAC5_EF451_FCB5_BB
});

class Genre {
  Genre({
    this.id,
    this.name,
    this.isActive,
    this.v,
  });

  String? id;
  String? name;
  bool? isActive;
  int? v;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
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
  THE_630_EF2_B06_FAC5_EF451_FCB5_D1,
  THE_630_EF2_BA6_FAC5_EF451_FCB5_DB,
  THE_630_EF2_C96_FAC5_EF451_FCB5_F7,
  THE_630_EF2_D36_FAC5_EF451_FCB607,
  THE_630_EF2_DD6_FAC5_EF451_FCB617,
  THE_630_EF2_EE6_FAC5_EF451_FCB639,
  THE_630_EF2_FC6_FAC5_EF451_FCB653,
  THE_630_EF30_B6_FAC5_EF451_FCB66_F
}

final seasonIdEnumValues = EnumValues({
  "630ef2b06fac5ef451fcb5d1": SeasonIdEnum.THE_630_EF2_B06_FAC5_EF451_FCB5_D1,
  "630ef2ba6fac5ef451fcb5db": SeasonIdEnum.THE_630_EF2_BA6_FAC5_EF451_FCB5_DB,
  "630ef2c96fac5ef451fcb5f7": SeasonIdEnum.THE_630_EF2_C96_FAC5_EF451_FCB5_F7,
  "630ef2d36fac5ef451fcb607": SeasonIdEnum.THE_630_EF2_D36_FAC5_EF451_FCB607,
  "630ef2dd6fac5ef451fcb617": SeasonIdEnum.THE_630_EF2_DD6_FAC5_EF451_FCB617,
  "630ef2ee6fac5ef451fcb639": SeasonIdEnum.THE_630_EF2_EE6_FAC5_EF451_FCB639,
  "630ef2fc6fac5ef451fcb653": SeasonIdEnum.THE_630_EF2_FC6_FAC5_EF451_FCB653,
  "630ef30b6fac5ef451fcb66f": SeasonIdEnum.THE_630_EF30_B6_FAC5_EF451_FCB66_F
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
