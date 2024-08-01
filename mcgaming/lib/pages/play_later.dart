import 'package:flutter/material.dart';

class PlayLater extends StatelessWidget {
  const PlayLater({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0XFF1A1B1E),
        appBar: AppBar(
          backgroundColor: const Color(0XFF1A1B1E),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'lib/images/logo_mcgaming.png',
                      width: 100.0, // Adjust the size as needed
                      height: 100.0,
                    ),
                    const SizedBox(
                        width: 10), // Space between the image and text
                  ],
                ),
                const SizedBox(
                  width:
                      200.0, // Set the desired width for the search container
                  height: 40.0, // Adjust the height of the search container
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search something",
                      hintStyle: TextStyle(
                        color: Color(0xffBAB0B0),
                        fontWeight: FontWeight.normal,
                      ),
                      filled: true,
                      fillColor: Color(0xff1A1B1E),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(
                          color: Color(0xffE299FF), // Purple border color
                          width: 1.5,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        borderSide: BorderSide(
                          color: Color(0xffE299FF), // Purple border color
                          width: 2.0,
                        ),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize:
                const Size.fromHeight(10.0), // Height of the bottom area
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffE299FF), // Background color of the bottom area
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffE299FF), // Shadow color and opacity
                    offset: Offset(0, 3), // Shadow offset
                    blurRadius: 4.0, // Shadow blur radius
                  ),
                ],
              ),
              height: 2.0, // Border thickness
            ),
          ),
        ),
        body: const DefaultTabController(
          length: 5,
          child: Column(
            children: [
              SizedBox(height: 40),
              Text(
                'PLAY LATER',
                style: TextStyle(
                  color: Color(0xffE399FF),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TabBar(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 50.0, // Adjust radius as needed
                            backgroundImage: AssetImage('lib/images/clow_close.png'),
                          ),
                          CircleAvatar(
                            radius: 50.0, // Adjust radius as needed
                            backgroundImage: AssetImage('lib/images/clow_close.png'),
                          ),
                        ],
                      ),
                    Center(
                        child: Text("Tab 2",
                            style: TextStyle(color: Color(0xffE299FF)))),
                    Center(
                        child: Text("Tab 3",
                            style: TextStyle(color: Color(0xffE299FF)))),
                    Center(
                        child: Text("Tab 4",
                            style: TextStyle(color: Color(0xffE299FF)))),
                    Center(
                        child: Text("Tab 5",
                            style: TextStyle(color: Color(0xffE299FF)))),
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
