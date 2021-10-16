class ChampionModel {
  String nom;
  String titre;
  String lore;

  ChampionModel({required this.nom, required this.titre, required this.lore});

  factory ChampionModel.fromJson(Map<String, dynamic> json, String champion) {
    final map = json['data'][champion];
    return ChampionModel(
      titre: map['title'],
      nom: map['name'],
      lore: map['lore'],
    );
  }
}
