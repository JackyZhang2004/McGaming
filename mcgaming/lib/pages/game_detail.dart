import 'package:flutter/material.dart';
import 'package:mcgaming/model/gameDataModel.dart';

class GameDetail extends StatelessWidget {
  final Gamedatamodel gamedatamodel;

  const GameDetail({super.key, required this.gamedatamodel});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: const Color(0XFF1A1B1E),
          body: Column(
            children: [
              Image.asset(gamedatamodel.imageURL),
              Text(gamedatamodel.name, style: const TextStyle(color: Colors.white),),
              Text(gamedatamodel.developer, style: const TextStyle(color: Colors.white),),
              Text(gamedatamodel.releaseDate, style: const TextStyle(color: Colors.white),),
              Text(gamedatamodel.publishedBy, style: const TextStyle(color: Colors.white),),
              Text(gamedatamodel.genre, style: const TextStyle(color: Colors.white),),
              Text(gamedatamodel.description, style: const TextStyle(color: Colors.white),),
            ],
          ),
        ));
  }
}
