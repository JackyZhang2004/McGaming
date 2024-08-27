import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mcgaming/model/gameDataModel.dart';
import 'package:mcgaming/pages/game_tictactoe.dart';

class ItemDetailPage extends StatelessWidget {
  final Gamedatamodel item;

  ItemDetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1B1E),
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1B1E),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                ),
                items: [
                  item.imageURL,
                  item.imageURL,
                  item.imageURL,
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
              ),
              SizedBox(height: 16),
              Text(
                item.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              DetailRow(title: 'Developer', value: item.developer),
              DetailRow(title: 'Released Date', value: item.releaseDate),
              DetailRow(title: 'Published by', value: item.publishedBy),
              DetailRow(title: 'Genre', value: item.genre),
              SizedBox(height: 16),
              Text(
                item.description,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                'TAG',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: item.tag.map((tag) {
                  return TagChip(label: tag);
                }).toList(),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  
              child: GestureDetector(
                onTap: () {
                  if (item.name == 'Tic Tac Toe') {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TicTacToePage(),
                    ));
                  } else {
                    // Handle other game navigation
                  }
                },
                child: Text(
                  'Play',
                  style: TextStyle(color: Colors.white),
                ),
              ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String title;
  final String value;

  DetailRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white54),
          ),
          SizedBox(width: 16),
          Text(
            value,
            style: TextStyle(color: Colors.purple),
          ),
        ],
      ),
    );
  }
}

class TagChip extends StatelessWidget {
  final String label;

  TagChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.purple,
    );
  }
}
