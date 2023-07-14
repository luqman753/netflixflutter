// To parse this JSON data, do
//
//     final showRandom = showRandomFromJson(jsonString);

import 'dart:convert';

List<ShowRandom> showRandomFromJson(String str) =>
    List<ShowRandom>.from(json.decode(str).map((x) => ShowRandom.fromJson(x)));

String showRandomToJson(List<ShowRandom> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShowRandom {
  ShowRandom({
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

  factory ShowRandom.fromJson(Map<String, dynamic> json) => ShowRandom(
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
        "_id": streamIdEnumValues.reverse[id],
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
        "streamId": streamIdEnumValues.reverse[streamId],
        "name": name,
        "role": roleValues.reverse[role],
        "episodes": episodesValues.reverse[episodes],
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

enum StreamIdEnum { THE_6308_B77520_EC702_F3_D2_A8_BCD }

final streamIdEnumValues = EnumValues({
  "6308b77520ec702f3d2a8bcd": StreamIdEnum.THE_6308_B77520_EC702_F3_D2_A8_BCD
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
        "_id": seasonIdEnumValues.reverse[id],
        "seriesId": streamIdEnumValues.reverse[seriesId],
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
        "seasonId": seasonIdEnumValues.reverse[seasonId],
        "episode": episode,
        "title": title,
        "description": description,
        "url": url,
        "__v": v,
      };
}

enum SeasonIdEnum {
  THE_6308_B79420_EC702_F3_D2_A8_BE3,
  THE_6308_B79_C20_EC702_F3_D2_A8_BED,
  THE_6308_B7_A920_EC702_F3_D2_A8_C09,
  THE_6308_B7_B520_EC702_F3_D2_A8_C19,
  THE_6308_B7_BF20_EC702_F3_D2_A8_C29,
  THE_6308_B7_D120_EC702_F3_D2_A8_C4_B,
  THE_6308_B7_DD20_EC702_F3_D2_A8_C65,
  THE_6308_B7_EA20_EC702_F3_D2_A8_C81
}

final seasonIdEnumValues = EnumValues({
  "6308b79420ec702f3d2a8be3": SeasonIdEnum.THE_6308_B79420_EC702_F3_D2_A8_BE3,
  "6308b79c20ec702f3d2a8bed": SeasonIdEnum.THE_6308_B79_C20_EC702_F3_D2_A8_BED,
  "6308b7a920ec702f3d2a8c09": SeasonIdEnum.THE_6308_B7_A920_EC702_F3_D2_A8_C09,
  "6308b7b520ec702f3d2a8c19": SeasonIdEnum.THE_6308_B7_B520_EC702_F3_D2_A8_C19,
  "6308b7bf20ec702f3d2a8c29": SeasonIdEnum.THE_6308_B7_BF20_EC702_F3_D2_A8_C29,
  "6308b7d120ec702f3d2a8c4b": SeasonIdEnum.THE_6308_B7_D120_EC702_F3_D2_A8_C4_B,
  "6308b7dd20ec702f3d2a8c65": SeasonIdEnum.THE_6308_B7_DD20_EC702_F3_D2_A8_C65,
  "6308b7ea20ec702f3d2a8c81": SeasonIdEnum.THE_6308_B7_EA20_EC702_F3_D2_A8_C81
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
