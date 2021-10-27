// ignore_for_file: file_names

import 'package:projet_android_kozlov/model/model.dart';

class ChampionViewModel {
  final Champion champion;
  ChampionViewModel({required this.champion});

  String get id {
    return champion.id;
  }

  String get nom {
    return champion.nom;
  }

  String get titre {
    return champion.titre;
  }

  String get blurb {
    return champion.blurb;
  }

  String get imageUrl {
    return champion.imageUrl;
  }

  @override
  String toString() {
    return nom;
  }

  bool get loved {
    return champion.loved;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': champion.id,
      'nom': champion.nom,
      'titre': champion.titre,
      'blurb': champion.blurb,
      'imageUrl': champion.imageUrl,
    };
  }
}
