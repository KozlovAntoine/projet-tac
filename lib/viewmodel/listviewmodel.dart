import 'package:flutter/material.dart';
import 'package:projet_android_kozlov/service/service.dart';
import 'package:projet_android_kozlov/viewmodel/viewmodel.dart';

class ViewModel with ChangeNotifier {
  List<ChampionViewModel> champions = [];

  ViewModel() {
    fetchChampions();
  }

  Future<void> fetchChampions() async {
    print('ViewModel update');
    final results = await Service().fetchChampions();
    champions = results
        .map((champion) => ChampionViewModel(champion: champion))
        .toList();
    print(champions);
    notifyListeners();
  }
}
