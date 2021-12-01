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
          Container(
            width: 190.0,
            height: 190.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(provider.selected.imageUrl),
              ),
            ),
          ),
          Text(provider.selected.nom),
          Text(provider.selected.titre),
          Text(provider.selected.blurb),
        ],
      ),
    );
  }
}
