import 'package:flutter/material.dart';
import 'package:projet_android_kozlov/viewmodel/viewmodel.dart';

class ChampionDetail extends StatefulWidget {
  final ChampionViewModel viewModel;
  ChampionDetail({required this.viewModel});
  @override
  State<ChampionDetail> createState() => _ChampionDetailState();
}

class _ChampionDetailState extends State<ChampionDetail> {
  @override
  Widget build(BuildContext context) {
    final champion = widget.viewModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(champion.nom),
      ),
      body: Column(
        children: [
          Image.network(champion.imageUrl),
          Text(champion.nom),
          Text(champion.titre),
          Text(champion.lore),
        ],
      ),
    );
  }
}
