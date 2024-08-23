import 'package:flutter/material.dart';
import 'package:mcgaming/components/my_appbar.dart';
import 'edit_profile.dart'; // Pastikan untuk mengimpor EditProfilePage

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MyAppbar(title: 'profile'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
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
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Align(
                    alignment: Alignment.center, // Center the text
                    child: Text(
                      'Your Activity',
                      style: TextStyle(color: Color(0xFFE299FF), fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ActivityColumn('10', 'Games'),
                      ActivityColumn('12', 'Hours'),
                      ActivityColumn('14', 'Minutes'),
                    ],
                  ),
                  SizedBox(height: 10), // Reduced height
                  InfoRow('Name', 'Jack'),
                  InfoRow('Email', 'Jack@gmail.com'),
                  InfoRow('Bio', 'Tidak Ada'),
                  SizedBox(height: 20), // Increased height for better separation
                  Center(
                    child: EditProfileButton(),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class ActivityColumn extends StatelessWidget {
  final String number;
  final String label;

  const ActivityColumn(this.number, this.label);

  @override
  Widget build(BuildContext context) {
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
}

class InfoRow extends StatelessWidget {
  final String label;
  final String info;

  const InfoRow(this.label, this.info);

  @override
  Widget build(BuildContext context) {
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
          Text(
            info,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class EditProfileButton extends StatelessWidget {
  const EditProfileButton();

  @override
  Widget build(BuildContext context) {
    return Container(
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
            MaterialPageRoute(builder: (context) => const EditProfilePage()),
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
        child: const Text('Edit Profile'),
      ),
    );
  }
}
