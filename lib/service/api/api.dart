class Api {
  /// URL de tous les champions
  static const allChampions =
      "http://ddragon.leagueoflegends.com/cdn/11.20.1/data/fr_FR/champion.json";

  /// URL pour un champion
  static const _championUrl =
      "http://ddragon.leagueoflegends.com/cdn/11.20.1/data/fr_FR/champion/";

  /// URL de l'image splach art
  static String championImageUrl(String img) {
    return 'http://ddragon.leagueoflegends.com/cdn/11.20.1/img/champion/$img';
  }

  /// Construit l'URL pour un champion
  static String championData(String champion) {
    return '$_championUrl$champion.json';
  }
}
