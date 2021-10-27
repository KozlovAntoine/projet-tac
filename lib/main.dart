import 'package:flutter/material.dart';
import 'package:projet_android_kozlov/service/local/database.dart';
import 'package:projet_android_kozlov/view/view.dart';
import 'package:projet_android_kozlov/viewmodel/listviewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DataBaseLovedChamp dataBaseLovedChamp = DataBaseLovedChamp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModel(),
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          home: ChampionList()),
    );
  }
}
