import 'package:projet_android_kozlov/service/api/api.dart';

class Champion {
  String nom;
  String titre;
  String lore;
  String imageUrl;

  Champion(
      {required this.nom,
      required this.titre,
      required this.lore,
      required this.imageUrl});

  factory Champion.fromJson(Map<String, dynamic> json) {
    return Champion(
      titre: json['title'],
      nom: json['name'],
      lore: json['blurb'],
      imageUrl: Api.championImageUrl(json['image']['full']),
    );
  }
}
