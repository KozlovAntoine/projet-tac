// ignore_for_file: file_names

import 'package:projet_android_kozlov/model/model.dart';

class ChampionViewModel {
  final Champion champion;
  ChampionViewModel({required this.champion});

  String get nom {
    return champion.nom;
  }

  String get titre {
    return champion.titre;
  }

  String get lore {
    return champion.lore;
  }

  String get imageUrl {
    return champion.imageUrl;
  }
}
