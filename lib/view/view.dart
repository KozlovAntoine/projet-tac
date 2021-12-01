import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:projet_android_kozlov/view/detailsview.dart';
import 'package:projet_android_kozlov/viewmodel/listviewmodel.dart';
import 'package:projet_android_kozlov/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

class ChampionList extends StatefulWidget {
  @override
  State<ChampionList> createState() => _ChampionListState();
}

class _ChampionListState extends State<ChampionList>
    with SingleTickerProviderStateMixin {
  final searchController = TextEditingController();

  late TabController _tabController;
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Tout'),
    Tab(text: 'Favoris'),
  ];

  /// Gere l'affichage de recherche
  bool searchMode = false;

  /// Gere l'affichage soit en mode liste ou soit en grille
  bool listMode = true;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ViewModel>(context, listen: false);
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        if (_tabController.index == 0) {
          provider.setInLovedTab(false);
          print('normal tab');
        } else {
          provider.setInLovedTab(true);
          print('loved tab');
        }
        provider.fetch();
      }
    });

    /// A chaque changement dans la barre de recherche
    /// on demande de mettre à jour la liste des champions
    searchController.addListener(() {
      provider.search(searchController.text);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          /// searchMode
          /// vrai: on affiche la barre de recherche
          /// faux: on affiche le titre
          title: searchMode
              ? TextField(
                  autofocus: true,
                  controller: searchController,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Nom du champion',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                )
              : const Text('LoL Champions'),
          actions: [
            IconButton(
              icon: Icon(searchMode ? Icons.clear : Icons.search),
              onPressed: () {
                setState(() {
                  searchMode = !searchMode;
                  if (!searchMode) {
                    searchController.text = "";
                  }
                });
              },
            ),
            IconButton(
              onPressed: () => setState(() {
                /// Affichage liste vers grille et vice versa
                listMode = !listMode;
              }),
              icon:
                  listMode ? const Icon(Icons.list) : const Icon(Icons.grid_on),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: myTabs,
          ),
        ),

        /// listMode
        /// vrai: on affiche la liste
        /// faux: on affiche la grille
        body: TabBarView(
          children: [
            Container(
              child: listMode ? list(context) : grid(context),
            ),
            Container(
              child: listMode ? list(context) : grid(context),
            ),
          ],
        ),
      ),
    );
  }

  /// Permet d'afficher une listview
  list(BuildContext context) {
    final provider = Provider.of<ViewModel>(context);
    final champions = provider.champions;
    return Consumer<ViewModel>(
      builder: (_, provider, __) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final champion = champions[index];
            return InkWell(
              onTap: () => details(champion),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: ListTile(
                  leading: ClipRRect(
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      imageUrl: champion.imageUrl,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  title: Text(champion.nom),
                  subtitle: Text(champion.titre),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: champion.loved ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      if (champion.loved) {
                        unFav(champion);
                      } else {
                        fav(champion);
                      }
                    },
                  ),
                ),
              ),
            );
          },
          itemCount: champions.length,
        );
      },
    );
  }

  /// Permet l'affichage d'une grille de
  /// 2: si le téléphone est en mode portrait
  /// 3: si le téléphone est en mode paysage
  grid(BuildContext context) {
    final provider = Provider.of<ViewModel>(context);
    final champions = provider.champions;
    return GridView.count(
      crossAxisCount:
          MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3,
      children: List.generate(champions.length, (index) {
        return Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  imageUrl: champions[index].imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 20,
                    color: Colors.black45,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(champions[index].nom,
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        );
      }),
    );
  }

  details(ChampionViewModel champion) {
    Provider.of<ViewModel>(context, listen: false).select(champion);
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => ChampionDetail()));
  }

  fav(ChampionViewModel champion) {
    Provider.of<ViewModel>(context, listen: false).addFavorite(champion);
  }

  unFav(ChampionViewModel champion) {
    Provider.of<ViewModel>(context, listen: false).removeFavorite(champion);
  }
}
