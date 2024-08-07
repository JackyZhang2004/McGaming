import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'item_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String username = 'Jack';

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      showUserSelectionDialog(context);
    });
  }

  void showUserSelectionDialog(BuildContext context) {
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       contentPadding: EdgeInsets.all(16.0),
    //       content: SizedBox(
    //         height: 200,
    //         child: ListView(
    //           scrollDirection: Axis.horizontal,
    //           children: <Widget>[
    //             UserProfile(
    //               imagePath: 'lib/images/dummylabux.png',
    //               userName: 'User 1',
    //               onTap: () {
    //                 Navigator.of(context).pop();
    //                 // Add action for User 1
    //               },
    //             ),
    //             UserProfile(
    //               imagePath: 'lib/images/dummylabux.png',
    //               userName: 'User 2',
    //               onTap: () {
    //                 Navigator.of(context).pop();
    //                 // Add action for User 2
    //               },
    //             ),
    //             UserProfile(
    //               imagePath: 'lib/images/dummylabux.png',
    //               userName: 'User 3',
    //               onTap: () {
    //                 Navigator.of(context).pop();
    //                 // Add action for User 3
    //               },
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1B1E),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1B1E),
        title: Row(
          children: [
            Image.asset('lib/images/dummylabux.png', height: 40),
            SizedBox(width: 16),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search something',
                  hintStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.transparent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Hi, $username',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Jumbotron(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Recommendation',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            RecommendedGamesSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF1A1B1E),
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
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
          SizedBox(height: 8),
          Text(
            userName,
            style: TextStyle(color: Colors.white),
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
  final List<Map<String, String>> recommendedGames = [
    {'name': 'Halo Infinite', 'image': 'lib/images/dummylabux.png'},
    {'name': 'Forza Horizon 5', 'image': 'lib/images/dummylabux.png'},
    {'name': 'Cyberpunk 2077', 'image': 'lib/images/dummylabux.png'},
    {'name': 'The Witcher 3', 'image': 'lib/images/dummylabux.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 3 / 2,  // Ratio ini bisa disesuaikan dengan ukuran gambar
        ),
        itemCount: recommendedGames.length,
        itemBuilder: (BuildContext context, int index) {
          final game = recommendedGames[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailPage(item: game),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,  // Atur sesuai ukuran gambar
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(game['image']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  game['name']!,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
