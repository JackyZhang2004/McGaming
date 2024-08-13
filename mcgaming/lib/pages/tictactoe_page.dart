import 'package:flutter/material.dart';

class TicTacToePage extends StatelessWidget {
  const TicTacToePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/images/background_tictactoe.jpg'), // Correct asset path
            fit: BoxFit.cover, // Ensure the image covers the entire background
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'TICTACTOE',
              style: TextStyle(
                fontSize: 48,
                color: Color(0xFFd59bf6), // Light purple/neon text color
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 60),
            CustomButton(
              text: '1 Player',
              onPressed: () {
                // Add functionality for 1 Player mode
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: '2 Players',
              onPressed: () {
                // Add functionality for 2 Players mode
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Back to home',
              onPressed: () {
                Navigator.pop(context);
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


