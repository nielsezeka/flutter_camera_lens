// To parse this JSON data, do
//
//     final searchBranchResponse = searchBranchResponseFromMap(jsonString);

import 'dart:convert';

List<SearchBranchResponse> searchBranchResponseFromMap(String str) =>
    List<SearchBranchResponse>.from(json.decode(str).map((x) => SearchBranchResponse.fromMap(x)));

String searchBranchResponseToMap(List<SearchBranchResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class SearchBranchResponse {
  SearchBranchResponse({
    this.id,
    this.img,
    this.fullname,
    this.vote,
    this.votes,
    this.photos,
    this.sort,
    this.countrows,
  });

  String id;
  String img;
  String fullname;
  String vote;
  String votes;
  String photos;
  String sort;
  String countrows;

  SearchBranchResponse copyWith({
    String id,
    String img,
    String fullname,
    String vote,
    String votes,
    String photos,
    String sort,
    String countrows,
  }) =>
      SearchBranchResponse(
        id: id ?? this.id,
        img: img ?? this.img,
        fullname: fullname ?? this.fullname,
        vote: vote ?? this.vote,
        votes: votes ?? this.votes,
        photos: photos ?? this.photos,
        sort: sort ?? this.sort,
        countrows: countrows ?? this.countrows,
      );

  factory SearchBranchResponse.fromMap(Map<String, dynamic> json) => SearchBranchResponse(
        id: json["id"] == null ? null : json["id"],
        img: json["img"] == null ? null : json["img"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        vote: json["vote"] == null ? null : json["vote"],
        votes: json["votes"] == null ? null : json["votes"],
        photos: json["photos"] == null ? null : json["photos"],
        sort: json["sort"] == null ? null : json["sort"],
        countrows: json["countrows"] == null ? null : json["countrows"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "img": img == null ? null : img,
        "fullname": fullname == null ? null : fullname,
        "vote": vote == null ? null : vote,
        "votes": votes == null ? null : votes,
        "photos": photos == null ? null : photos,
        "sort": sort == null ? null : sort,
        "countrows": countrows == null ? null : countrows,
      };
}
