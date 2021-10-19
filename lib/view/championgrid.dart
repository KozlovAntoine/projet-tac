import 'package:flutter/material.dart';
import 'package:projet_android_kozlov/view/championlist.dart';
import 'package:projet_android_kozlov/viewmodel/listviewmodel.dart';
import 'package:provider/provider.dart';

class ChampionGrid extends StatefulWidget {
  @override
  State<ChampionGrid> createState() => _ChampionGridState();
}

class _ChampionGridState extends State<ChampionGrid> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('LoL Champions'),
          actions: [
            IconButton(
              onPressed: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => ChampionList())),
              icon: const Icon(Icons.list),
            ),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(provider.champions.length, (index) {
            return Center(
              child: Column(
                children: [
                  Image.network(provider.champions[index].imageUrl),
                  Text(provider.champions[index].nom),
                ],
              ),
            );
          }),
        ));
  }
}
