import 'dart:convert';

List<GenreModel> genreFromJson(String str) =>
    List<GenreModel>.from(json.decode(str).map((x) => GenreModel.fromJson(x)));

String genreToJson(List<GenreModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GenreModel {
  GenreModel({
    this.data,
    this.total,
  });

  List<Data>? data;
  int? total;

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "total": total,
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.isActive,
    this.v,
  });

  String? id;
  String? name;
  bool? isActive;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
