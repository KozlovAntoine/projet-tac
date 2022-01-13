import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  static String version = "11.20.1";

  /// URL de tous les champions
  static Future<String> allChampions() async {
    print('version');
    await setVersion();
    return "http://ddragon.leagueoflegends.com/cdn/$version/data/fr_FR/champion.json";
  }

  /// URL pour un champion
  static String championUrl() {
    print('championUrl $version');
    return "http://ddragon.leagueoflegends.com/cdn/$version/data/fr_FR/champion/";
  }

  /// URL de l'image splach art
  static String championImageUrl(String img) {
    print('championImageUrl $version');
    return 'http://ddragon.leagueoflegends.com/cdn/$version/img/champion/$img';
  }

  static String spellImageUrl(String spell) {
    print('spellImageUrl $version');
    return 'http://ddragon.leagueoflegends.com/cdn/$version/img/spell/$spell.png';
  }

  /// Construit l'URL pour un champion
  static String championData(String champion) {
    print('championData $version');
    return '${championUrl()}$champion.json';
  }

  static Future<void> setVersion() async {
    final response = await http.get(
        Uri.parse("https://ddragon.leagueoflegends.com/api/versions.json"));
    if (response.statusCode == 200) {
      final body = jsonDecode(utf8.decode(response.bodyBytes));
      final json = body as List<dynamic>;
      Api.version = json[0];
    } else {
      throw Exception('Erreur lors du chargement de la version');
    }
  }
}
