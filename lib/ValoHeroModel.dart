// To parse this JSON data, do
//
//     final valoHeroModel = valoHeroModelFromJson(jsonString);

import 'dart:convert';

ValoHeroModel valoHeroModelFromJson(String str) => ValoHeroModel.fromJson(json.decode(str));

String valoHeroModelToJson(ValoHeroModel data) => json.encode(data.toJson());

class ValoHeroModel {
  ValoHeroModel({
    this.status,
    this.data,
  });

  int status;
  List<Datum> data;

  factory ValoHeroModel.fromJson(Map<String, dynamic> json) => ValoHeroModel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.characterTags,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.killfeedPortrait,
    this.assetPath,
    this.isFullPortraitRightFacing,
    this.isPlayableCharacter,
    this.isAvailableForTest,
    this.isBaseContent,
    this.role,
    this.abilities,
    this.voiceLine,
  });

  String uuid;
  String displayName;
  String description;
  String developerName;
  List<String> characterTags;
  String displayIcon;
  String displayIconSmall;
  String bustPortrait;
  String fullPortrait;
  String killfeedPortrait;
  String assetPath;
  bool isFullPortraitRightFacing;
  bool isPlayableCharacter;
  bool isAvailableForTest;
  bool isBaseContent;
  Role role;
  List<Ability> abilities;
  VoiceLine voiceLine;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    uuid: json["uuid"],
    displayName: json["displayName"],
    description: json["description"],
    developerName: json["developerName"],
    characterTags: json["characterTags"] == null ? null : List<String>.from(json["characterTags"].map((x) => x)),
    displayIcon: json["displayIcon"],
    displayIconSmall: json["displayIconSmall"],
    bustPortrait: json["bustPortrait"] == null ? null : json["bustPortrait"],
    fullPortrait: json["fullPortrait"] == null ? null : json["fullPortrait"],
    killfeedPortrait: json["killfeedPortrait"],
    assetPath: json["assetPath"],
    isFullPortraitRightFacing: json["isFullPortraitRightFacing"],
    isPlayableCharacter: json["isPlayableCharacter"],
    isAvailableForTest: json["isAvailableForTest"],
    isBaseContent: json["isBaseContent"],
    role: json["role"] == null ? null : Role.fromJson(json["role"]),
    abilities: List<Ability>.from(json["abilities"].map((x) => Ability.fromJson(x))),
    voiceLine: VoiceLine.fromJson(json["voiceLine"]),
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "displayName": displayName,
    "description": description,
    "developerName": developerName,
    "characterTags": characterTags == null ? null : List<dynamic>.from(characterTags.map((x) => x)),
    "displayIcon": displayIcon,
    "displayIconSmall": displayIconSmall,
    "bustPortrait": bustPortrait == null ? null : bustPortrait,
    "fullPortrait": fullPortrait == null ? null : fullPortrait,
    "killfeedPortrait": killfeedPortrait,
    "assetPath": assetPath,
    "isFullPortraitRightFacing": isFullPortraitRightFacing,
    "isPlayableCharacter": isPlayableCharacter,
    "isAvailableForTest": isAvailableForTest,
    "isBaseContent": isBaseContent,
    "role": role == null ? null : role.toJson(),
    "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
    "voiceLine": voiceLine.toJson(),
  };
}

class Ability {
  Ability({
    this.slot,
    this.displayName,
    this.description,
    this.displayIcon,
  });

  Slot slot;
  String displayName;
  String description;
  String displayIcon;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
    slot: slotValues.map[json["slot"]],
    displayName: json["displayName"],
    description: json["description"],
    displayIcon: json["displayIcon"] == null ? null : json["displayIcon"],
  );

  Map<String, dynamic> toJson() => {
    "slot": slotValues.reverse[slot],
    "displayName": displayName,
    "description": description,
    "displayIcon": displayIcon == null ? null : displayIcon,
  };
}

enum Slot { ABILITY1, ABILITY2, GRENADE, ULTIMATE, PASSIVE }

final slotValues = EnumValues({
  "Ability1": Slot.ABILITY1,
  "Ability2": Slot.ABILITY2,
  "Grenade": Slot.GRENADE,
  "Passive": Slot.PASSIVE,
  "Ultimate": Slot.ULTIMATE
});

class Role {
  Role({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.assetPath,
  });

  String uuid;
  String displayName;
  String description;
  String displayIcon;
  String assetPath;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    uuid: json["uuid"],
    displayName: json["displayName"],
    description: json["description"],
    displayIcon: json["displayIcon"],
    assetPath: json["assetPath"],
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "displayName": displayName,
    "description": description,
    "displayIcon": displayIcon,
    "assetPath": assetPath,
  };
}

class VoiceLine {
  VoiceLine({
    this.minDuration,
    this.maxDuration,
    this.mediaList,
  });

  double minDuration;
  double maxDuration;
  List<MediaList> mediaList;

  factory VoiceLine.fromJson(Map<String, dynamic> json) => VoiceLine(
    minDuration: json["minDuration"].toDouble(),
    maxDuration: json["maxDuration"].toDouble(),
    mediaList: List<MediaList>.from(json["mediaList"].map((x) => MediaList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "minDuration": minDuration,
    "maxDuration": maxDuration,
    "mediaList": List<dynamic>.from(mediaList.map((x) => x.toJson())),
  };
}

class MediaList {
  MediaList({
    this.id,
    this.wwise,
    this.wave,
  });

  int id;
  String wwise;
  String wave;

  factory MediaList.fromJson(Map<String, dynamic> json) => MediaList(
    id: json["id"],
    wwise: json["wwise"],
    wave: json["wave"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "wwise": wwise,
    "wave": wave,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
