import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:projet_android_kozlov/model/api/api.dart';
import 'package:projet_android_kozlov/model/model.dart';

class Service {
  Future<ChampionModel> fetchChampion(String champion) async {
    final response = await http.get(Uri.parse(Api.championData(champion)));
    if (response.statusCode == 200) {
      return ChampionModel.fromJson(
          jsonDecode(utf8.decode(response.bodyBytes)), champion);
    } else {
      throw Exception('Erreur lors du chargement de $champion');
    }
  }
}
