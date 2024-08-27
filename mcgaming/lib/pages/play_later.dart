import 'package:flutter/material.dart';
import 'package:mcgaming/components/my_appbar.dart';
import 'package:mcgaming/model/gameDataModel.dart';
import 'package:mcgaming/pages/game_detail.dart';
import 'package:mcgaming/pages/item_detail_page.dart';

class PlayLater extends StatefulWidget {
  const PlayLater({super.key});

  @override
  State<PlayLater> createState() => _PlayLaterState();
}

class _PlayLaterState extends State<PlayLater> {
  static List gamename = [
    'Tic Tac Toe',
    'Forza Horizon 5 xbox',
    'Forza Horizon 5 open world',
    'Forza Horizon 5 fps',
    'Forza Horizon 5 rpg'
  ];
  static List url = [
    'lib/images/tictactoe.avif',
    'lib/images/forzahorizon.jpg',
    'lib/images/forzahorizon.jpg',
    'lib/images/forzahorizon.jpg',
    'lib/images/forzahorizon.jpg'
  ];
  static List developer = [
    'developer 1',
    'developer 2',
    'developer 3',
    'developer 4',
    'developer 5'
  ];
  static List releaseDate = [
    'September 23, 2022',
    'November 9, 2021',
    'November 11, 2021',
    'November 25, 2021',
    'November 9, 2021'
  ];
  static List publishedBy = [
    'Ubisoft',
    'Garena',
    'Electronic Arts',
    'Capcom',
    'Garena'
  ];
  static List genre = ['RPG', 'Xbox Game Pass', 'Open World', 'FPS', 'RPG'];
  static List description = [
    'Forza Horizon focuses specifically on casual street racing, rather than professionally on race tracks, as it takes place on a map of temporarily closed public roads. The open-world map that players can explore is based on the U.S. state of Colorado.',
    'Forza Horizon focuses specifically on casual street racing, rather than professionally on race tracks, as it takes place on a map of temporarily closed public roads. The open-world map that players can explore is based on the U.S. state of Colorado.',
    'Forza Horizon focuses specifically on casual street racing, rather than professionally on race tracks, as it takes place on a map of temporarily closed public roads. The open-world map that players can explore is based on the U.S. state of Colorado.',
    'Forza Horizon focuses specifically on casual street racing, rather than professionally on race tracks, as it takes place on a map of temporarily closed public roads. The open-world map that players can explore is based on the U.S. state of Colorado.',
    'Forza Horizon focuses specifically on casual street racing, rather than professionally on race tracks, as it takes place on a map of temporarily closed public roads. The open-world map that players can explore is based on the U.S. state of Colorado.'
  ];
  static List tag = [
    ['Racing', 'Extreme'],
    ['Racing', 'Extreme'],
    ['Racing', 'Extreme'],
    ['Racing', 'Extreme'],
    ['Racing', 'Extreme']
  ];

  final List<Gamedatamodel> gamesdata = List.generate(
    gamename.length,
    (index) => Gamedatamodel(
        '${gamename[index]}',
        '${url[index]}',
        '${developer[index]}',
        '${releaseDate[index]}',
        '${publishedBy[index]}',
        '${genre[index]}',
        '${description[index]}',
        tag[index]),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0XFF1A1B1E),
        appBar: const MyAppbar(title: 'PLAY LATER',),
        body: DefaultTabController(
          length: 5,
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                'PLAY LATER',
                style: TextStyle(
                  color: Color(0xffE399FF),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelColor: Colors.white,
                unselectedLabelColor: Color(0xff998CC2),
                indicatorColor: Color(0xffE299FF),
                tabs: [
                  Tab(text: "All Games"),
                  Tab(text: "RPG"),
                  Tab(text: "Xbox Game Pass"),
                  Tab(text: "Open World"),
                  Tab(text: "FPS"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    AllGamesTab(gamesdata: gamesdata),
                    GenreGamesTab(gamesdata: gamesdata, genre: 'RPG'),
                    GenreGamesTab(
                        gamesdata: gamesdata, genre: 'Xbox Game Pass'),
                    GenreGamesTab(gamesdata: gamesdata, genre: 'Open World'),
                    GenreGamesTab(gamesdata: gamesdata, genre: 'FPS'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllGamesTab extends StatelessWidget {
  final List<Gamedatamodel> gamesdata;

  const AllGamesTab({super.key, required this.gamesdata});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemCount: gamesdata.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ItemDetailPage(
                item: gamesdata[index],
              )
            )
          );

                    
          },
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(gamesdata[index].imageURL),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                gamesdata[index].name,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}

class GenreGamesTab extends StatelessWidget {
  final List<Gamedatamodel> gamesdata;
  final String genre;

  const GenreGamesTab(
      {super.key, required this.gamesdata, required this.genre});

  @override
  Widget build(BuildContext context) {
    final filteredGames =
        gamesdata.where((game) => game.genre == genre).toList();
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.5,
      ),
      itemCount: filteredGames.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ItemDetailPage(
                item: gamesdata[index],
                )
              )
            );
          },
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(filteredGames[index].imageURL),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                filteredGames[index].name,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
