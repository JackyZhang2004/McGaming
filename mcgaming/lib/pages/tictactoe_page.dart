import 'package:flutter/material.dart';
import 'package:mcgaming/pages/game_tictactoe.dart'; // Import your GameTictactoe page

class TictactoePage extends StatelessWidget {
  const TictactoePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/background_tictactoe.jpg'), // Ensure the image path is correct
            fit: BoxFit.cover, // Cover the background
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'TICTACTOE',
              style: TextStyle(
                fontSize: 48,
                color: Color(0xFFd59bf6), // Neon light purple text color
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            CustomButton(
              text: 'Play Game',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GameTictactoe()), // Navigate to the game page
                );
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Back to Home',
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }
}
