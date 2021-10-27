import 'package:path/path.dart';
import 'package:projet_android_kozlov/viewmodel/viewmodel.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseLovedChamp {
  static late Future<Database> _database;

  DataBaseLovedChamp._privateConstructor();
  static final DataBaseLovedChamp instance =
      DataBaseLovedChamp._privateConstructor();

  DataBaseLovedChamp() {
    _database = _initDatabase();
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'loved.db'),
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE Champions(id TEXT, nom TEXT, titre TEXT, blurb TEXT, imageUrl TEXT)");
      },
      version: 1,
    );
  }

  Future<Database> get database async {
    return _database;
  }

  Future<Database> get initDone => _database;

  void insert(ChampionViewModel championViewModel) async {
    final db = await instance.database;
    await db.insert("Champions", championViewModel.toMap());
  }

  void remove(ChampionViewModel championViewModel) async {
    final db = await instance.database;
    await db.delete("Champions",
        where: 'id = ?', whereArgs: [championViewModel.id]);
  }
}
