import 'dart:convert';

import 'package:projet_android_kozlov/service/api/api.dart';

class Spell {
  String id;
  String name;
  String description;
  String imgUrl;

  Spell(
      {required this.id,
      required this.name,
      required this.description,
      required this.imgUrl});

  factory Spell.fromJson(Map<String, dynamic> json) {
    return Spell(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        imgUrl: Api.spellImageUrl(json['id']));
  }
}
