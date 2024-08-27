import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this package
import 'package:flutter/scheduler.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mcgaming/components/my_appbar.dart';
import 'package:mcgaming/model/gameDataModel.dart';
import 'package:mcgaming/pages/my_game_page.dart';
import 'item_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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

  
  final String username = 'Jack';

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showUserSelectionDialog(context);
    });
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF1A1B1E),
      statusBarIconBrightness: Brightness.light,
    ));
  }

  void showUserSelectionDialog(BuildContext context) {
    // Implementation for user selection dialog
  }

  @override
  Widget build(BuildContext context) {
    // Get the `gamesdata` from `_MyGameState`
    final gamesdata = _HomePageState().gamesdata;

    return Scaffold(
      backgroundColor: const Color(0xFF1A1B1E),
      appBar: const MyAppbar(title: 'Home'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Hi, $username',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Jumbotron(),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Recommendation',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // Pass `gamesdata` to `RecommendedGamesSection`
            RecommendedGamesSection(gamesdata: gamesdata),
          ],
        ),
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  final String imagePath;
  final String userName;
  final Function onTap;

  UserProfile({
    required this.imagePath,
    required this.userName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 40,
          ),
          const SizedBox(height: 8),
          Text(
            userName,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class Jumbotron extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
      ),
      items: [
        'lib/images/dummylabux.png',
        'lib/images/dummylabux.png',
        'lib/images/dummylabux.png'
      ].map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class RecommendedGamesSection extends StatelessWidget {
  final List<Gamedatamodel> gamesdata;

  RecommendedGamesSection({required this.gamesdata});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 2,
        ),
        itemCount: gamesdata.length,
        itemBuilder: (BuildContext context, int index) {
          final game = gamesdata[index];
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(game.imageURL),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  game.name,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
