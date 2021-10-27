import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projet_android_kozlov/model/model.dart';
import 'package:projet_android_kozlov/service/local/database.dart';

import 'api/api.dart';

class Service {
  /// Recupere un model depuis l'api
  Future<Champion> fetchChampion(String champion) async {
    final response = await http.get(Uri.parse(Api.championData(champion)));
    if (response.statusCode == 200) {
      return Champion.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Erreur lors du chargement de $champion');
    }
  }

  /// Recupere la liste du model depuis l'api
  Future<List<Champion>> fetchChampions() async {
    final response = await http.get(Uri.parse(Api.allChampions));
    if (response.statusCode == 200) {
      final body = jsonDecode(utf8.decode(response.bodyBytes));
      final json = body['data'] as Map<String, dynamic>;
      List<Champion> champions = [];
      json.forEach((key, value) => champions.add(Champion.fromJson(value)));
      return champions;
    } else {
      throw Exception('Erreur lors du chargement des champions.');
    }
  }

  Future<List<Champion>> fetchLovedFromLocal() async {
    final db = await DataBaseLovedChamp.instance.database;
    List<Map<String, dynamic>> champions = await db.query("Champions");
    return List.generate(
        champions.length, (index) => Champion.fromMap(champions[index]));
  }
}