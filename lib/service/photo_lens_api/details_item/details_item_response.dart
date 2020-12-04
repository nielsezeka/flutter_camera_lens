// To parse this JSON data, do
//
//     final detailsItemResponse = detailsItemResponseFromMap(jsonString);

import 'dart:convert';

DetailsItemResponse detailsItemResponseFromMap(String str) => DetailsItemResponse.fromMap(json.decode(str));

String detailsItemResponseToMap(DetailsItemResponse data) => json.encode(data.toMap());

class DetailsItemResponse {
  DetailsItemResponse({
    this.id,
    this.img,
    this.forum,
    this.login,
    this.pictures,
    this.photos,
    this.recalls,
    this.fullname,
    this.recallscount,
    this.photocount,
    this.info,
    this.features,
    this.url,
    this.similar,
    this.characteristics,
    this.ratings,
    this.links,
  });

  String id;
  String img;
  String forum;
  String login;
  List<Picture> pictures;
  dynamic photos;
  dynamic recalls;
  String fullname;
  String recallscount;
  String photocount;
  String info;
  Features features;
  String url;
  List<Similar> similar;
  List<Characteristic> characteristics;
  List<Characteristic> ratings;
  List<Link> links;

  DetailsItemResponse copyWith({
    String id,
    String img,
    String forum,
    String login,
    List<Picture> pictures,
    dynamic photos,
    dynamic recalls,
    String fullname,
    String recallscount,
    String photocount,
    String info,
    Features features,
    String url,
    List<Similar> similar,
    List<Characteristic> characteristics,
    List<Characteristic> ratings,
    List<Link> links,
  }) =>
      DetailsItemResponse(
        id: id ?? this.id,
        img: img ?? this.img,
        forum: forum ?? this.forum,
        login: login ?? this.login,
        pictures: pictures ?? this.pictures,
        photos: photos ?? this.photos,
        recalls: recalls ?? this.recalls,
        fullname: fullname ?? this.fullname,
        recallscount: recallscount ?? this.recallscount,
        photocount: photocount ?? this.photocount,
        info: info ?? this.info,
        features: features ?? this.features,
        url: url ?? this.url,
        similar: similar ?? this.similar,
        characteristics: characteristics ?? this.characteristics,
        ratings: ratings ?? this.ratings,
        links: links ?? this.links,
      );

  factory DetailsItemResponse.fromMap(Map<String, dynamic> json) => DetailsItemResponse(
        id: json["id"] == null ? null : json["id"],
        img: json["img"] == null ? null : json["img"],
        forum: json["forum"] == null ? null : json["forum"],
        login: json["login"] == null ? null : json["login"],
        pictures: json["pictures"] == null ? null : List<Picture>.from(json["pictures"].map((x) => Picture.fromMap(x))),
        photos: json["photos"],
        recalls: json["recalls"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        recallscount: json["recallscount"] == null ? null : json["recallscount"],
        photocount: json["photocount"] == null ? null : json["photocount"],
        info: json["info"] == null ? null : json["info"],
        features: json["features"] == null ? null : Features.fromMap(json["features"]),
        url: json["url"] == null ? null : json["url"],
        similar: json["similar"] == null ? null : List<Similar>.from(json["similar"].map((x) => Similar.fromMap(x))),
        characteristics: json["characteristics"] == null
            ? null
            : List<Characteristic>.from(json["characteristics"].map((x) => Characteristic.fromMap(x))),
        ratings: json["ratings"] == null
            ? null
            : List<Characteristic>.from(json["ratings"].map((x) => Characteristic.fromMap(x))),
        links: json["links"] == null ? null : List<Link>.from(json["links"].map((x) => Link.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "img": img == null ? null : img,
        "forum": forum == null ? null : forum,
        "login": login == null ? null : login,
        "pictures": pictures == null ? null : List<dynamic>.from(pictures.map((x) => x.toMap())),
        "photos": photos,
        "recalls": recalls,
        "fullname": fullname == null ? null : fullname,
        "recallscount": recallscount == null ? null : recallscount,
        "photocount": photocount == null ? null : photocount,
        "info": info == null ? null : info,
        "features": features == null ? null : features.toMap(),
        "url": url == null ? null : url,
        "similar": similar == null ? null : List<dynamic>.from(similar.map((x) => x.toMap())),
        "characteristics": characteristics == null ? null : List<dynamic>.from(characteristics.map((x) => x.toMap())),
        "ratings": ratings == null ? null : List<dynamic>.from(ratings.map((x) => x.toMap())),
        "links": links == null ? null : List<dynamic>.from(links.map((x) => x.toMap())),
      };
}

class Characteristic {
  Characteristic({
    this.name,
    this.value,
  });

  String name;
  String value;

  Characteristic copyWith({
    String name,
    String value,
  }) =>
      Characteristic(
        name: name ?? this.name,
        value: value ?? this.value,
      );

  factory Characteristic.fromMap(Map<String, dynamic> json) => Characteristic(
        name: json["name"] == null ? null : json["name"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "value": value == null ? null : value,
      };
}

class Features {
  Features({
    this.the0,
    this.rc,
    this.fisheye,
    this.mirror,
    this.shift,
    this.softmode,
    this.featuresIs,
    this.dc,
  });

  String the0;
  String rc;
  String fisheye;
  String mirror;
  String shift;
  String softmode;
  String featuresIs;
  String dc;

  Features copyWith({
    String the0,
    String rc,
    String fisheye,
    String mirror,
    String shift,
    String softmode,
    String featuresIs,
    String dc,
  }) =>
      Features(
        the0: the0 ?? this.the0,
        rc: rc ?? this.rc,
        fisheye: fisheye ?? this.fisheye,
        mirror: mirror ?? this.mirror,
        shift: shift ?? this.shift,
        softmode: softmode ?? this.softmode,
        featuresIs: featuresIs ?? this.featuresIs,
        dc: dc ?? this.dc,
      );

  factory Features.fromMap(Map<String, dynamic> json) => Features(
        the0: json["0"] == null ? null : json["0"],
        rc: json["rc"] == null ? null : json["rc"],
        fisheye: json["fisheye"] == null ? null : json["fisheye"],
        mirror: json["mirror"] == null ? null : json["mirror"],
        shift: json["shift"] == null ? null : json["shift"],
        softmode: json["softmode"] == null ? null : json["softmode"],
        featuresIs: json["is"] == null ? null : json["is"],
        dc: json["dc"] == null ? null : json["dc"],
      );

  Map<String, dynamic> toMap() => {
        "0": the0 == null ? null : the0,
        "rc": rc == null ? null : rc,
        "fisheye": fisheye == null ? null : fisheye,
        "mirror": mirror == null ? null : mirror,
        "shift": shift == null ? null : shift,
        "softmode": softmode == null ? null : softmode,
        "is": featuresIs == null ? null : featuresIs,
        "dc": dc == null ? null : dc,
      };
}

class Link {
  Link({
    this.descr,
    this.link,
  });

  String descr;
  String link;

  Link copyWith({
    String descr,
    String link,
  }) =>
      Link(
        descr: descr ?? this.descr,
        link: link ?? this.link,
      );

  factory Link.fromMap(Map<String, dynamic> json) => Link(
        descr: json["descr"] == null ? null : json["descr"],
        link: json["link"] == null ? null : json["link"],
      );

  Map<String, dynamic> toMap() => {
        "descr": descr == null ? null : descr,
        "link": link == null ? null : link,
      };
}

class Picture {
  Picture({
    this.url,
    this.preview,
  });

  String url;
  String preview;

  Picture copyWith({
    String url,
    String preview,
  }) =>
      Picture(
        url: url ?? this.url,
        preview: preview ?? this.preview,
      );

  factory Picture.fromMap(Map<String, dynamic> json) => Picture(
        url: json["url"] == null ? null : json["url"],
        preview: json["preview"] == null ? null : json["preview"],
      );

  Map<String, dynamic> toMap() => {
        "url": url == null ? null : url,
        "preview": preview == null ? null : preview,
      };
}

class Similar {
  Similar({
    this.id,
    this.img,
    this.fullname,
    this.system,
    this.focallength,
    this.focallength2,
    this.diaphragm,
    this.diaphragm2,
    this.mindiaphragm,
    this.url,
  });

  String id;
  String img;
  String fullname;
  String system;
  String focallength;
  dynamic focallength2;
  String diaphragm;
  dynamic diaphragm2;
  String mindiaphragm;
  String url;

  Similar copyWith({
    String id,
    String img,
    String fullname,
    String system,
    String focallength,
    dynamic focallength2,
    String diaphragm,
    dynamic diaphragm2,
    String mindiaphragm,
    String url,
  }) =>
      Similar(
        id: id ?? this.id,
        img: img ?? this.img,
        fullname: fullname ?? this.fullname,
        system: system ?? this.system,
        focallength: focallength ?? this.focallength,
        focallength2: focallength2 ?? this.focallength2,
        diaphragm: diaphragm ?? this.diaphragm,
        diaphragm2: diaphragm2 ?? this.diaphragm2,
        mindiaphragm: mindiaphragm ?? this.mindiaphragm,
        url: url ?? this.url,
      );

  factory Similar.fromMap(Map<String, dynamic> json) => Similar(
        id: json["id"] == null ? null : json["id"],
        img: json["img"] == null ? null : json["img"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        system: json["system"] == null ? null : json["system"],
        focallength: json["focallength"] == null ? null : json["focallength"],
        focallength2: json["focallength2"],
        diaphragm: json["diaphragm"] == null ? null : json["diaphragm"],
        diaphragm2: json["diaphragm2"],
        mindiaphragm: json["mindiaphragm"] == null ? null : json["mindiaphragm"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "img": img == null ? null : img,
        "fullname": fullname == null ? null : fullname,
        "system": system == null ? null : system,
        "focallength": focallength == null ? null : focallength,
        "focallength2": focallength2,
        "diaphragm": diaphragm == null ? null : diaphragm,
        "diaphragm2": diaphragm2,
        "mindiaphragm": mindiaphragm == null ? null : mindiaphragm,
        "url": url == null ? null : url,
      };
}
