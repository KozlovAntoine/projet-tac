import 'package:flutter/material.dart';
import 'package:projet_android_kozlov/model/model.dart';
import 'package:projet_android_kozlov/service/local/database.dart';
import 'package:projet_android_kozlov/service/service.dart';
import 'package:projet_android_kozlov/viewmodel/viewmodel.dart';

class ViewModel with ChangeNotifier {
  List<ChampionViewModel> champions = [];
  ChampionViewModel? _selected;
  bool inLovedTab = false;

  ViewModel() {
    fetchChampions();
  }

  Future<void> fetch() async {
    if (inLovedTab)
      fetchLovedChampions();
    else
      fetchChampions();
  }

  /// Recupere toute la liste des champions
  /// On stocke dans champions
  /// On notifie les listeners
  Future<void> fetchChampions() async {
    inLovedTab = false;
    final results = await _merge();
    champions = results
        .map((champion) => ChampionViewModel(champion: champion))
        .toList();
    notifyListeners();
  }

  Future<List<Champion>> _merge() async {
    List<Champion> list = [];
    final results = await Service().fetchChampions();
    final loved = await Service().fetchLovedFromLocal();
    list.addAll(loved);
    list.addAll(results);
    return list;
  }

  /// On recupere tous les champions qui contient search dans leur nom ou id
  /// On stocke dans champions
  /// On notifie les listeners
  Future<void> search(String search) async {
    final results = await _merge();

    /// on ignore les majuscules
    final research = results.where((element) =>
        element.nom.toLowerCase().contains(search.toLowerCase()) ||
        element.id.toLowerCase().contains(search.toLowerCase()));
    champions = research
        .map((champion) => ChampionViewModel(champion: champion))
        .toList();
    notifyListeners();
  }

  Future<void> fetchLovedChampions() async {
    inLovedTab = true;
    final results = await Service().fetchLovedFromLocal();
    champions = results
        .map((champion) => ChampionViewModel(champion: champion))
        .toList();
    notifyListeners();
  }

  void addFavorite(ChampionViewModel champion) async {
    DataBaseLovedChamp.instance.insert(champion);
    await fetch();
    notifyListeners();
  }

  void removeFavorite(ChampionViewModel champion) async {
    DataBaseLovedChamp.instance.remove(champion);
    await fetch();
    notifyListeners();
  }

  void select(ChampionViewModel champion) {
    _selected = champion;
    notifyListeners();
  }

  ChampionViewModel get selected {
    return _selected!;
  }
}
