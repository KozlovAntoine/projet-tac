import 'package:flutter/widgets.dart';

class Api {
  static const _allChampions =
      "http://ddragon.leagueoflegends.com/cdn/11.20.1/data/en_US/champion.json";
  static const _championUrl =
      "http://ddragon.leagueoflegends.com/cdn/11.20.1/data/fr_FR/champion/";

  static Image championImage(String champion) {
    return Image.network(
        'http://ddragon.leagueoflegends.com/cdn/11.20.1/img/champion/$champion.png');
  }
}
