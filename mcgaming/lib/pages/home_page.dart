import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String username = 'User'; // Ganti dengan username yang diinginkan

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => showUserSelectionDialog(context));
  }

  void showUserSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(16.0),
          content: SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                UserProfile(
                  imagePath: '',
                  userName: 'User 1',
                  onTap: () {
                    Navigator.of(context).pop();
                    // Add action for User 1
                  },
                ),
                UserProfile(
                  imagePath: '',
                  userName: 'User 2',
                  onTap: () {
                    Navigator.of(context).pop();
                    // Add action for User 2
                  },
                ),
                UserProfile(
                  imagePath: '',
                  userName: 'User 3',
                  onTap: () {
                    Navigator.of(context).pop();
                    // Add action for User 3
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        backgroundColor: Color(0xFF1A1B1E),
      ),
      body: Container(
        color: Color(0xFF1A1B1E),
        child: SingleChildScrollView(
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
                  'Recommended Games',
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
      ),
    );
  }
}

class Jumbotron extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.blueAccent,
      child: Center(
        child: Text(
          'Promo of the Day!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class RecommendedGamesSection extends StatelessWidget {
  final List<Map<String, String>> games = [
    {'name': 'Game 1', 'image': 'lib/images/dummylabux.png'},
    {'name': 'Game 2', 'image': 'lib/images/dummylabux.png'},
    {'name': 'Game 3', 'image': 'lib/images/dummylabux.png'},
    {'name': 'Game 4', 'image': 'lib/images/dummylabux.png'},
    {'name': 'Game 5', 'image': 'lib/images/dummylabux.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: games.length,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      games[index]['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  color: Colors.black,
                  child: Text(
                    games[index]['name']!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class UserProfile extends StatelessWidget {
  final String imagePath;
  final String userName;
  final VoidCallback onTap;

  UserProfile({required this.imagePath, required this.userName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8.0),
        width: 100,
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              userName,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
