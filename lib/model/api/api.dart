class Api {
  static const _allChampions =
      "http://ddragon.leagueoflegends.com/cdn/11.20.1/data/fr_FR/champion.json";
  static const _championUrl =
      "http://ddragon.leagueoflegends.com/cdn/11.20.1/data/fr_FR/champion/";

  static String championImageUrl(String champion) {
    return 'http://ddragon.leagueoflegends.com/cdn/11.20.1/img/champion/$champion.png';
  }

  static String championData(String champion) {
    return '$_championUrl$champion.json';
  }
}
