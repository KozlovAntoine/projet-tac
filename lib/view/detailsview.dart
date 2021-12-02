import 'package:flutter/material.dart';
import 'package:projet_android_kozlov/model/spell.dart';
import 'package:projet_android_kozlov/viewmodel/listviewmodel.dart';
import 'package:provider/provider.dart';

class ChampionDetail extends StatefulWidget {
  @override
  State<ChampionDetail> createState() => _ChampionDetailState();
}

class _ChampionDetailState extends State<ChampionDetail> {
  final toucheSorts = ['A', 'Z', 'E', 'R'];
  Spell? selectedSpell;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: provider.selected != null
            ? Text(provider.selected!.nom)
            : Container(),
      ),
      body: provider.selected != null
          ? SingleChildScrollView(child: principale())
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  principale() {
    final provider = Provider.of<ViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
            width: 190.0,
            height: 190.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(provider.selected!.imageUrl),
              ),
            ),
          ),
          Text(
            provider.selected!.nom,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          Text(
            provider.selected!.titre,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          Text(provider.selected!.blurb, textAlign: TextAlign.justify),
          const SizedBox(height: 3),
          Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  color: Colors.black,
                  height: 2,
                ),
              ),
              const SizedBox(width: 20),
              const Text(
                'Sorts',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  color: Colors.black,
                  height: 2,
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 3),
          Row(children: [
            afficherSorts(provider.selected!.spells[0], 0),
            afficherSorts(provider.selected!.spells[1], 1),
            afficherSorts(provider.selected!.spells[2], 2),
            afficherSorts(provider.selected!.spells[3], 3),
          ], mainAxisAlignment: MainAxisAlignment.spaceBetween),
          const SizedBox(height: 8),
          infoSort(),
        ],
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }

  afficherSorts(Spell spell, int index) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selectedSpell = spell;
            });
          },
          child: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: selectedSpell != spell
                  ? DecorationImage(
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      fit: BoxFit.fill,
                      image: NetworkImage(spell.imgUrl),
                    )
                  : DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(spell.imgUrl),
                    ),
            ),
          ),
        ),
        const SizedBox(height: 3),
        Text(toucheSorts[index], style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  infoSort() {
    return selectedSpell == null
        ? Container()
        : Column(
            children: [
              Text(
                selectedSpell!.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                selectedSpell!.description.replaceAll("<br>", "\n"),
                textAlign: TextAlign.justify,
              )
            ],
          );
  }
}
