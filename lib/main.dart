import 'package:flutter/material.dart';
import 'package:projet_android_kozlov/model/model.dart';
import 'package:projet_android_kozlov/model/service/service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PagePrincipale(),
    );
  }
}

class PagePrincipale extends StatefulWidget {
  const PagePrincipale({Key? key}) : super(key: key);

  @override
  State<PagePrincipale> createState() => _PagePrincipaleState();
}

class _PagePrincipaleState extends State<PagePrincipale> {
  late Future<ChampionModel> futureChampion;

  @override
  void initState() {
    super.initState();
    futureChampion = Service().fetchChampion('Aatrox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoL Champions'),
      ),
      body: Center(
        child: FutureBuilder<ChampionModel>(
          future: futureChampion,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(snapshot.data!.titre),
                  Text(snapshot.data!.nom),
                  Text(snapshot.data!.lore),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
