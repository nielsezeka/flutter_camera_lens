// To parse this JSON data, do
//
//     final searchParamResponse = searchParamResponseFromMap(jsonString);

import 'dart:convert';

SearchParamResponse searchParamResponseFromMap(String str) => SearchParamResponse.fromMap(json.decode(str));

String searchParamResponseToMap(SearchParamResponse data) => json.encode(data.toMap());

class SearchParamResponse {
  SearchParamResponse({
    this.systems,
    this.systemsOthers,
    this.brands,
    this.brandsOthers,
    this.formats,
    this.focusdestination,
    this.autofocus,
    this.focallength,
    this.diaphragms,
    this.typeslensesOne,
    this.typeslensesTwo,
    this.typeslensesThree,
  });

  List<System> systems;
  List<System> systemsOthers;
  List<Brand> brands;
  List<Brand> brandsOthers;
  Formats formats;
  Focusdestination focusdestination;
  List<String> autofocus;
  List<Focallength> focallength;
  List<Diaphragm> diaphragms;
  List<Typeslenses> typeslensesOne;
  List<Typeslenses> typeslensesTwo;
  List<Typeslenses> typeslensesThree;

  SearchParamResponse copyWith({
    List<System> systems,
    List<System> systemsOthers,
    List<Brand> brands,
    List<Brand> brandsOthers,
    Formats formats,
    Focusdestination focusdestination,
    List<String> autofocus,
    List<Focallength> focallength,
    List<Diaphragm> diaphragms,
    List<Typeslenses> typeslensesOne,
    List<Typeslenses> typeslensesTwo,
    List<Typeslenses> typeslensesThree,
  }) =>
      SearchParamResponse(
        systems: systems ?? this.systems,
        systemsOthers: systemsOthers ?? this.systemsOthers,
        brands: brands ?? this.brands,
        brandsOthers: brandsOthers ?? this.brandsOthers,
        formats: formats ?? this.formats,
        focusdestination: focusdestination ?? this.focusdestination,
        autofocus: autofocus ?? this.autofocus,
        focallength: focallength ?? this.focallength,
        diaphragms: diaphragms ?? this.diaphragms,
        typeslensesOne: typeslensesOne ?? this.typeslensesOne,
        typeslensesTwo: typeslensesTwo ?? this.typeslensesTwo,
        typeslensesThree: typeslensesThree ?? this.typeslensesThree,
      );

  factory SearchParamResponse.fromMap(Map<String, dynamic> json) => SearchParamResponse(
        systems: json["systems"] == null ? null : List<System>.from(json["systems"].map((x) => System.fromMap(x))),
        systemsOthers: json["systems_others"] == null
            ? null
            : List<System>.from(json["systems_others"].map((x) => System.fromMap(x))),
        brands: json["brands"] == null ? null : List<Brand>.from(json["brands"].map((x) => Brand.fromMap(x))),
        brandsOthers:
            json["brands_others"] == null ? null : List<Brand>.from(json["brands_others"].map((x) => Brand.fromMap(x))),
        formats: json["formats"] == null ? null : Formats.fromMap(json["formats"]),
        focusdestination: json["focusdestination"] == null ? null : Focusdestination.fromMap(json["focusdestination"]),
        autofocus: json["autofocus"] == null ? null : List<String>.from(json["autofocus"].map((x) => x)),
        focallength: json["focallength"] == null
            ? null
            : List<Focallength>.from(json["focallength"].map((x) => Focallength.fromMap(x))),
        diaphragms: json["diaphragms"] == null
            ? null
            : List<Diaphragm>.from(json["diaphragms"].map((x) => Diaphragm.fromMap(x))),
        typeslensesOne: json["typeslenses_one"] == null
            ? null
            : List<Typeslenses>.from(json["typeslenses_one"].map((x) => Typeslenses.fromMap(x))),
        typeslensesTwo: json["typeslenses_two"] == null
            ? null
            : List<Typeslenses>.from(json["typeslenses_two"].map((x) => Typeslenses.fromMap(x))),
        typeslensesThree: json["typeslenses_three"] == null
            ? null
            : List<Typeslenses>.from(json["typeslenses_three"].map((x) => Typeslenses.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "systems": systems == null ? null : List<dynamic>.from(systems.map((x) => x.toMap())),
        "systems_others": systemsOthers == null ? null : List<dynamic>.from(systemsOthers.map((x) => x.toMap())),
        "brands": brands == null ? null : List<dynamic>.from(brands.map((x) => x.toMap())),
        "brands_others": brandsOthers == null ? null : List<dynamic>.from(brandsOthers.map((x) => x.toMap())),
        "formats": formats == null ? null : formats.toMap(),
        "focusdestination": focusdestination == null ? null : focusdestination.toMap(),
        "autofocus": autofocus == null ? null : List<dynamic>.from(autofocus.map((x) => x)),
        "focallength": focallength == null ? null : List<dynamic>.from(focallength.map((x) => x.toMap())),
        "diaphragms": diaphragms == null ? null : List<dynamic>.from(diaphragms.map((x) => x.toMap())),
        "typeslenses_one": typeslensesOne == null ? null : List<dynamic>.from(typeslensesOne.map((x) => x.toMap())),
        "typeslenses_two": typeslensesTwo == null ? null : List<dynamic>.from(typeslensesTwo.map((x) => x.toMap())),
        "typeslenses_three":
            typeslensesThree == null ? null : List<dynamic>.from(typeslensesThree.map((x) => x.toMap())),
      };
}

class Brand {
  Brand({
    this.id,
    this.brand,
  });

  String id;
  String brand;

  Brand copyWith({
    String id,
    String brand,
  }) =>
      Brand(
        id: id ?? this.id,
        brand: brand ?? this.brand,
      );

  factory Brand.fromMap(Map<String, dynamic> json) => Brand(
        id: json["id"] == null ? null : json["id"],
        brand: json["brand"] == null ? null : json["brand"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "brand": brand == null ? null : brand,
      };
}

class Diaphragm {
  Diaphragm({
    this.id,
    this.secId,
    this.diaphragm,
  });

  String id;
  String secId;
  String diaphragm;

  Diaphragm copyWith({
    String id,
    String secId,
    String diaphragm,
  }) =>
      Diaphragm(
        id: id ?? this.id,
        secId: secId ?? this.secId,
        diaphragm: diaphragm ?? this.diaphragm,
      );

  factory Diaphragm.fromMap(Map<String, dynamic> json) => Diaphragm(
        id: json["id"] == null ? null : json["id"],
        secId: json["sec_id"] == null ? null : json["sec_id"],
        diaphragm: json["diaphragm"] == null ? null : json["diaphragm"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "sec_id": secId == null ? null : secId,
        "diaphragm": diaphragm == null ? null : diaphragm,
      };
}

class Focallength {
  Focallength({
    this.id,
    this.secId,
    this.focallength,
  });

  String id;
  String secId;
  String focallength;

  Focallength copyWith({
    String id,
    String secId,
    String focallength,
  }) =>
      Focallength(
        id: id ?? this.id,
        secId: secId ?? this.secId,
        focallength: focallength ?? this.focallength,
      );

  factory Focallength.fromMap(Map<String, dynamic> json) => Focallength(
        id: json["id"] == null ? null : json["id"],
        secId: json["sec_id"] == null ? null : json["sec_id"],
        focallength: json["focallength"] == null ? null : json["focallength"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "sec_id": secId == null ? null : secId,
        "focallength": focallength == null ? null : focallength,
      };
}

class Focusdestination {
  Focusdestination({
    this.zoom,
    this.fix,
  });

  String zoom;
  String fix;

  Focusdestination copyWith({
    String zoom,
    String fix,
  }) =>
      Focusdestination(
        zoom: zoom ?? this.zoom,
        fix: fix ?? this.fix,
      );

  factory Focusdestination.fromMap(Map<String, dynamic> json) => Focusdestination(
        zoom: json["zoom"] == null ? null : json["zoom"],
        fix: json["fix"] == null ? null : json["fix"],
      );

  Map<String, dynamic> toMap() => {
        "zoom": zoom == null ? null : zoom,
        "fix": fix == null ? null : fix,
      };
}

class Formats {
  Formats({
    this.the16,
    this.m43,
    this.apsc,
    this.rc,
    this.slr,
    this.rc2,
    this.slr2,
    this.ff,
  });

  String the16;
  String m43;
  String apsc;
  String rc;
  String slr;
  String rc2;
  String slr2;
  String ff;

  Formats copyWith({
    String the16,
    String m43,
    String apsc,
    String rc,
    String slr,
    String rc2,
    String slr2,
    String ff,
  }) =>
      Formats(
        the16: the16 ?? this.the16,
        m43: m43 ?? this.m43,
        apsc: apsc ?? this.apsc,
        rc: rc ?? this.rc,
        slr: slr ?? this.slr,
        rc2: rc2 ?? this.rc2,
        slr2: slr2 ?? this.slr2,
        ff: ff ?? this.ff,
      );

  factory Formats.fromMap(Map<String, dynamic> json) => Formats(
        the16: json["16"] == null ? null : json["16"],
        m43: json["m43"] == null ? null : json["m43"],
        apsc: json["apsc"] == null ? null : json["apsc"],
        rc: json["rc"] == null ? null : json["rc"],
        slr: json["slr"] == null ? null : json["slr"],
        rc2: json["rc2"] == null ? null : json["rc2"],
        slr2: json["slr2"] == null ? null : json["slr2"],
        ff: json["ff"] == null ? null : json["ff"],
      );

  Map<String, dynamic> toMap() => {
        "16": the16 == null ? null : the16,
        "m43": m43 == null ? null : m43,
        "apsc": apsc == null ? null : apsc,
        "rc": rc == null ? null : rc,
        "slr": slr == null ? null : slr,
        "rc2": rc2 == null ? null : rc2,
        "slr2": slr2 == null ? null : slr2,
        "ff": ff == null ? null : ff,
      };
}

class System {
  System({
    this.id,
    this.system,
  });

  String id;
  String system;

  System copyWith({
    String id,
    String system,
  }) =>
      System(
        id: id ?? this.id,
        system: system ?? this.system,
      );

  factory System.fromMap(Map<String, dynamic> json) => System(
        id: json["id"] == null ? null : json["id"],
        system: json["system"] == null ? null : json["system"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "system": system == null ? null : system,
      };
}

class Typeslenses {
  Typeslenses({
    this.name,
    this.value,
  });

  String name;
  String value;

  Typeslenses copyWith({
    String name,
    String value,
  }) =>
      Typeslenses(
        name: name ?? this.name,
        value: value ?? this.value,
      );

  factory Typeslenses.fromMap(Map<String, dynamic> json) => Typeslenses(
        name: json["name"] == null ? null : json["name"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "value": value == null ? null : value,
      };
}
