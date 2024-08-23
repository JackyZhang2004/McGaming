import 'package:flutter/material.dart';
import 'package:mcgaming/components/my_appbar.dart';
import 'profile.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const MyAppbar(title: 'profile'),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFE299FF), width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFE299FF),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7, // 70% width of the screen
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: const Color(0xFFE299FF)),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFE299FF),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Your Activity',
                      style: TextStyle(color: Color(0xFFE299FF), fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      activityColumn('10', 'Games'),
                      activityColumn('12', 'Hours'),
                      activityColumn('14', 'Minutes'),
                    ],
                  ),
                  const SizedBox(height: 10), // Reduced height
                  infoTextField('Name', 'Jack'),
                  infoTextField('Email', 'Jack@gmail.com'),
                  infoTextField('Bio', 'Tidak Ada'),
                  const SizedBox(height: 20), // Increased height for better separation
                  Center(
                    child: Container(
                      width: 150,
                      height: 33,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFE299FF),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ProfilePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xFFE299FF),
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: BorderSide.none,
                        ),
                        child: const Text('Save Changes'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20), // Additional space at the bottom for better scrolling experience
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFFE299FF)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_emotions, color: Color(0xFFE299FF)),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget activityColumn(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }

  Widget infoTextField(String label, String initialValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4), // Reduced vertical padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Color(0xFFE299FF), fontSize: 16),
          ),
          const SizedBox(height: 4),
          TextField(
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE299FF)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE299FF)),
              ),
              hintText: initialValue,
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
