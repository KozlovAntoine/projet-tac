import 'package:flutter/material.dart';
import 'package:projet_android_kozlov/view/championgrid.dart';
import 'package:projet_android_kozlov/view/detailsview.dart';
import 'package:projet_android_kozlov/viewmodel/listviewmodel.dart';
import 'package:provider/provider.dart';

class ChampionList extends StatefulWidget {
  @override
  State<ChampionList> createState() => _ChampionListState();
}

class _ChampionListState extends State<ChampionList> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoL Champions'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => ChampionGrid())),
            icon: const Icon(Icons.grid_on),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final champion = provider.champions[index];
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ChampionDetail(viewModel: champion))),
            child: ListTile(
              leading: ClipRRect(
                child: Image.network(champion.imageUrl),
                borderRadius: BorderRadius.circular(5),
              ),
              title: Text(champion.nom),
              subtitle: Text(champion.titre),
            ),
          );
        },
        itemCount: provider.champions.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }
}
