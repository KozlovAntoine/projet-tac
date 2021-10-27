import 'package:projet_android_kozlov/service/api/api.dart';

/// Le modele
class Champion {
  String id;
  String nom;
  String titre;
  String blurb;
  String imageUrl;
  bool loved;

  Champion(
      {required this.nom,
      required this.titre,
      required this.blurb,
      required this.imageUrl,
      required this.id,
      required this.loved});

  factory Champion.fromJson(Map<String, dynamic> json) {
    return Champion(
      id: json['id'],
      titre: json['title'],
      nom: json['name'],
      blurb: json['blurb'],
      imageUrl: Api.championImageUrl(json['image']['full']),
      loved: false,
    );
  }

  factory Champion.fromMap(Map<String, dynamic> map) {
    return Champion(
        nom: map['nom'],
        titre: map['titre'],
        blurb: map['blurb'],
        imageUrl: map['imageUrl'],
        id: map['id'],
        loved: true);
  }
}
