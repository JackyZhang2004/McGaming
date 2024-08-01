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
              Text(gamedatamodel.name, style: TextStyle(color: Colors.white),),
              Text(gamedatamodel.developer, style: TextStyle(color: Colors.white),),
              Text(gamedatamodel.releaseDate, style: TextStyle(color: Colors.white),),
              Text(gamedatamodel.publishedBy, style: TextStyle(color: Colors.white),),
              Text(gamedatamodel.genre, style: TextStyle(color: Colors.white),),
              Text(gamedatamodel.description, style: TextStyle(color: Colors.white),),
            ],
          ),
        ));
  }
}
