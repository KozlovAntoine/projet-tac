import 'package:flutter/material.dart';
import 'package:projet_android_kozlov/viewmodel/listviewmodel.dart';
import 'package:provider/provider.dart';

class ChampionDetail extends StatefulWidget {
  @override
  State<ChampionDetail> createState() => _ChampionDetailState();
}

class _ChampionDetailState extends State<ChampionDetail> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(provider.selected.nom),
      ),
      body: Column(
        children: [
          Image.network(provider.selected.imageUrl),
          Text(provider.selected.nom),
          Text(provider.selected.titre),
          Text(provider.selected.blurb),
        ],
      ),
    );
  }
}