import 'package:projet_android_kozlov/service/api/api.dart';

class Champion {
  String id;
  String nom;
  String titre;
  String lore;
  String imageUrl;

  Champion(
      {required this.nom,
      required this.titre,
      required this.lore,
      required this.imageUrl,
      required this.id});

  factory Champion.fromJson(Map<String, dynamic> json) {
    return Champion(
      id: json['id'],
      titre: json['title'],
      nom: json['name'],
      lore: json['blurb'],
      imageUrl: Api.championImageUrl(json['image']['full']),
    );
  }
}
