import 'package:flutter/material.dart';
import 'package:projet_android_kozlov/api/api.dart';

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

class PagePrincipale extends StatelessWidget {
  const PagePrincipale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoL Champions'),
      ),
      body: Center(
        child: Api.championImage('Aatrox'),
      ),
    );
  }
}
