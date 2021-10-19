class Api {
  static const allChampions =
      "http://ddragon.leagueoflegends.com/cdn/11.20.1/data/fr_FR/champion.json";
  static const _championUrl =
      "http://ddragon.leagueoflegends.com/cdn/11.20.1/data/fr_FR/champion/";

  static String championImageUrl(String img) {
    return 'http://ddragon.leagueoflegends.com/cdn/11.20.1/img/champion/$img';
  }

  static String championData(String champion) {
    return '$_championUrl$champion.json';
  }
}
