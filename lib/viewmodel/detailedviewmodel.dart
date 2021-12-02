import 'package:projet_android_kozlov/model/model.dart';
import 'package:projet_android_kozlov/model/spell.dart';
import 'package:projet_android_kozlov/viewmodel/viewmodel.dart';

class DetailViewModel {
  final ChampionViewModel champion;
  final List<Spell> spells;

  DetailViewModel({required this.champion, required this.spells});

  String get id {
    return champion.id;
  }

  String get nom {
    return champion.nom;
  }

  String get titre {
    return champion.titre;
  }

  String get blurb {
    return champion.blurb;
  }

  String get imageUrl {
    return champion.imageUrl;
  }

  @override
  String toString() {
    return nom;
  }

  bool get loved {
    return champion.loved;
  }
}
