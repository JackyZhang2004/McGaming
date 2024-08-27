import 'package:flutter/material.dart';

class ClowChat extends StatelessWidget {
  const ClowChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1A29),
      appBar: AppBar(
        backgroundColor: const Color(0xFF734ACC),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigasi ke halaman utama
          },
        ),
        title: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 0), // Mengatur padding untuk mengurangi jarak antara ikon back dan avatar
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/images/clow_chat.png'), // Gambar avatar CLOW
                radius: 20,
              ),
            ),
            SizedBox(width: 8), // Tambahkan sedikit jarak antara avatar dan teks
            Text('CLOW', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                ChatBubble(
                  text: 'Hi! What can I do for you?',
                  isClow: true,
                  color: Color(0xFF734ACC),
                ),
                ChatBubble(
                  text: 'Please give me game recommendations',
                  isClow: false,
                  color: Color(0xFFE299FF),
                ),
                ChatBubble(
                  text: 'Sure, here are the top 5 recommendations:\n1. Tic Tac Toe\n2. Valorant\n3. Solo Leveling\n4. Genshin Impact\n5. Wuthering Waves',
                  isClow: true,
                  color: Color(0xFF734ACC),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: MessageInput(),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isClow;
  final Color color;

  const ChatBubble({
    required this.text,
    required this.isClow,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isClow ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: TextStyle(color: isClow ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

class MessageInput extends StatelessWidget {
  const MessageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF2C2A35),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type your message...',
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.send, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }
}
