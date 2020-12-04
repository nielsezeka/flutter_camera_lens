// To parse this JSON data, do
//
//     final topBranchResponse = topBranchResponseFromMap(jsonString);

import 'dart:convert';

List<TopBranchResponse> topBranchResponseFromMap(String str) =>
    List<TopBranchResponse>.from(json.decode(str).map((x) => TopBranchResponse.fromMap(x)));

String topBranchResponseToMap(List<TopBranchResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class TopBranchResponse {
  TopBranchResponse({
    this.id,
    this.img,
    this.fullname,
    this.vote,
    this.photos,
    this.date,
    this.countrows,
  });

  String id;
  String img;
  String fullname;
  String vote;
  String photos;
  DateTime date;
  String countrows;

  TopBranchResponse copyWith({
    String id,
    String img,
    String fullname,
    String vote,
    String photos,
    DateTime date,
    String countrows,
  }) =>
      TopBranchResponse(
        id: id ?? this.id,
        img: img ?? this.img,
        fullname: fullname ?? this.fullname,
        vote: vote ?? this.vote,
        photos: photos ?? this.photos,
        date: date ?? this.date,
        countrows: countrows ?? this.countrows,
      );

  factory TopBranchResponse.fromMap(Map<String, dynamic> json) => TopBranchResponse(
        id: json["id"] == null ? null : json["id"],
        img: json["img"] == null ? null : json["img"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        vote: json["vote"] == null ? null : json["vote"],
        photos: json["photos"] == null ? null : json["photos"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        countrows: json["countrows"] == null ? null : json["countrows"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "img": img == null ? null : img,
        "fullname": fullname == null ? null : fullname,
        "vote": vote == null ? null : vote,
        "photos": photos == null ? null : photos,
        "date": date == null ? null : date.toIso8601String(),
        "countrows": countrows == null ? null : countrows,
      };
}
