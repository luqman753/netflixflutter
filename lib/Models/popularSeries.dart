import 'dart:convert';

List<PopularSeries> popularSeriesFromJson(String str) =>
    List<PopularSeries>.from(
        json.decode(str).map((x) => PopularSeries.fromJson(x)));

String popularSeriesToJson(List<PopularSeries> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PopularSeries {
  PopularSeries({
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
  List<Genre>? genres;
  List<Cast>? casts;
  List<Season>? seasons;

  factory PopularSeries.fromJson(Map<String, dynamic> json) => PopularSeries(
        id: idValues.map![json["_id"]],
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
        "_id": idValues.reverse![id],
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
  THE_6308_B77520_EC702_F3_D2_A8_BCD,
  THE_6308_C42_B298_A1_C2_AD26_C663_B,
  THE_630_C76_E8962_EA9_BC904_EFAF5,
  THE_630_C7783962_EA9_BC904_EFB5_E,
  THE_630_C7_CFA962_EA9_BC904_EFBD5,
  THE_630_C7_E16962_EA9_BC904_EFC66,
  THE_630_DC3_A26_E17_B83_B05_FCFF3_A,
  THE_630_DC6516_E17_B83_B05_FD0056,
  THE_630_F2_FBA344_A3_FF051_FB7_E9_A,
  THE_630_F32_CC344_A3_FF051_FB7_F02
}

final idValues = EnumValues({
  "6308b77520ec702f3d2a8bcd": Id.THE_6308_B77520_EC702_F3_D2_A8_BCD,
  "6308c42b298a1c2ad26c663b": Id.THE_6308_C42_B298_A1_C2_AD26_C663_B,
  "630c76e8962ea9bc904efaf5": Id.THE_630_C76_E8962_EA9_BC904_EFAF5,
  "630c7783962ea9bc904efb5e": Id.THE_630_C7783962_EA9_BC904_EFB5_E,
  "630c7cfa962ea9bc904efbd5": Id.THE_630_C7_CFA962_EA9_BC904_EFBD5,
  "630c7e16962ea9bc904efc66": Id.THE_630_C7_E16962_EA9_BC904_EFC66,
  "630dc3a26e17b83b05fcff3a": Id.THE_630_DC3_A26_E17_B83_B05_FCFF3_A,
  "630dc6516e17b83b05fd0056": Id.THE_630_DC6516_E17_B83_B05_FD0056,
  "630f2fba344a3ff051fb7e9a": Id.THE_630_F2_FBA344_A3_FF051_FB7_E9_A,
  "630f32cc344a3ff051fb7f02": Id.THE_630_F32_CC344_A3_FF051_FB7_F02
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
