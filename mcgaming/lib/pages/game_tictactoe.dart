import 'package:flutter/material.dart';
import 'package:mcgaming/pages/tictactoe_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TicTacToePage(),
    );
  }
}

class TicTacToePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GameTictactoe()),
            );
          },
          child: Text('Start Game'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.purpleAccent,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

class GameTictactoe extends StatefulWidget {
  @override
  _GameTictactoeState createState() => _GameTictactoeState();
}

class _GameTictactoeState extends State<GameTictactoe> {
  List<String> board = List.filled(9, ''); // Representasi board 3x3
  bool isXTurn = true; // Menentukan giliran X atau O
  String winner = ''; // Menyimpan pemenang permainan

  void _resetGame() {
    setState(() {
      board = List.filled(9, '');
      isXTurn = true;
      winner = '';
    });
  }

  void _makeMove(int index) {
    if (board[index] == '' && winner == '') {
      setState(() {
        board[index] = isXTurn ? 'X' : 'O';
        isXTurn = !isXTurn;
        winner = _checkWinner();
      });
    }
  }

  String _checkWinner() {
    const List<List<int>> winningCombinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Baris
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Kolom
      [0, 4, 8], [2, 4, 6] // Diagonal
    ];

    for (var combination in winningCombinations) {
      if (board[combination[0]] != '' &&
          board[combination[0]] == board[combination[1]] &&
          board[combination[1]] == board[combination[2]]) {
        return board[combination[0]]; // Mengembalikan X atau O sebagai pemenang
      }
    }

    if (!board.contains('')) {
      return 'Draw'; // Jika tidak ada ruang kosong dan tidak ada pemenang, hasil seri
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/background_tictactoe.jpg'), // Ganti dengan path gambar yang benar
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TICTACTOE',
                    style: TextStyle(
                      color: Colors.purpleAccent,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),
                  // Papan Tic Tac Toe
                  Container(
                    width: 300,
                    height: 400,
                    child: GridView(
                      physics: NeverScrollableScrollPhysics(), // Menonaktifkan scroll
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                      children: List.generate(9, (index) {
                        return GestureDetector(
                          onTap: () {
                            _makeMove(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              border: Border.all(color: Colors.purpleAccent, width: 2),
                            ),
                            child: Center(
                              child: board[index] == ''
                                  ? Container() // Tidak ada gambar jika kotak kosong
                                  : Image.asset(
                                      board[index] == 'X'
                                          ? 'lib/images/x_image.png' // Ganti dengan path gambar X
                                          : 'lib/images/o_image.png', // Ganti dengan path gambar O
                                      width: 60,
                                      height: 60,
                                    ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Hasil dan tombol restart
                  if (winner != '')
                    Column(
                      children: [
                        Text(
                          winner == 'Draw' ? 'It\'s a Draw!' : '$winner Wins!',
                          style: TextStyle(
                            color: Colors.purpleAccent,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _resetGame,
                          child: Text('Restart Game'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: Colors.purpleAccent,
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          if (winner != '')
            Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.purpleAccent),
                iconSize: 40,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => TicTacToePage()),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
