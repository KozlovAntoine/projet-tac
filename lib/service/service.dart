import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projet_android_kozlov/model/model.dart';

import 'api/api.dart';

class Service {
  Future<Champion> fetchChampion(String champion) async {
    final response = await http.get(Uri.parse(Api.championData(champion)));
    final imgUrl = Api.championImageUrl(champion);
    if (response.statusCode == 200) {
      return Champion.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Erreur lors du chargement de $champion');
    }
  }

  Future<List<Champion>> fetchChampions() async {
    print('fetchChampions');
    final response = await http.get(Uri.parse(Api.allChampions));
    if (response.statusCode == 200) {
      final body = jsonDecode(utf8.decode(response.bodyBytes));
      final json = body['data'] as Map<String, dynamic>;
      List<Champion> champions = [];
      json.forEach((key, value) => champions.add(Champion.fromJson(value)));
      print('champions: $champions');
      return champions;
    } else {
      throw Exception('Erreur lors du chargement des champions.');
    }
  }
}
