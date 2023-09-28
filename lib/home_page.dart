import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/styles.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> displayxo = ['', '', '', '', '', '', '', '', ''];
  bool o_turn = true;
  int oScore = 0;
  int xScore = 0;
  int scoreDraw=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[700],

        body: Column(
          children: [
            Expanded(
              child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Player O',
                              style: TextStyles.myNewfontWhite.copyWith(fontSize: 12),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              oScore.toString(),
                              style: TextStyles.myNewfont,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Player X',
                              style: TextStyles.myNewfontWhite.copyWith(fontSize: 12),
                            ),
                           const SizedBox(height: 10,),
                            Text(
                              xScore.toString(),
                              style: TextStyles.myNewfont,
                            )
                          ],
                        ),
                      )
                    ],
                  )),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: displayxo.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _ontap(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade800)),
                      child: Center(
                        child: Text(
                          displayxo[index],
                          style: TextStyles.myNewfont,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(child: Container(
              padding: const EdgeInsets.all(20),
              child: Text('TIC TAC TOE',style: TextStyles.myNewfontWhite,),
            )),
          ],
        ));
  }

  void _ontap(int index) {
    setState(() {
      if (o_turn && displayxo[index] == '') {
        displayxo[index] = 'O';
        scoreDraw+=1;
      } else if (!o_turn && displayxo[index] == '') {
        displayxo[index] = 'X';
        scoreDraw+=1;
      }
      o_turn = !o_turn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayxo[0] == displayxo[1] &&
        displayxo[0] == displayxo[2] &&
        displayxo[0] != '') {
      _showDialog(displayxo[0]);
    } else if (displayxo[3] == displayxo[4] &&
        displayxo[3] == displayxo[5] &&
        displayxo[3] != '') {
      _showDialog(displayxo[3]);
    } else if (displayxo[6] == displayxo[7] &&
        displayxo[6] == displayxo[8] &&
        displayxo[6] != '') {
      _showDialog(displayxo[6]);
    } else if (displayxo[0] == displayxo[3] &&
        displayxo[0] == displayxo[6] &&
        displayxo[0] != '') {
      _showDialog(displayxo[0]);
    } else if (displayxo[1] == displayxo[4] &&
        displayxo[1] == displayxo[7] &&
        displayxo[1] != '') {
      _showDialog(displayxo[1]);
    } else if (displayxo[2] == displayxo[5] &&
        displayxo[2] == displayxo[8] &&
        displayxo[2] != '') {
      _showDialog(displayxo[2]);
    } else if (displayxo[0] == displayxo[4] &&
        displayxo[0] == displayxo[8] &&
        displayxo[0] != '') {
      _showDialog(displayxo[0]);
    } else if (displayxo[2] == displayxo[4] &&
        displayxo[2] == displayxo[6] &&
        displayxo[2] != '') {
      _showDialog(displayxo[2]);
    } else if (scoreDraw == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('Draw',style:TextStyles.myNewfont ,),
          actions: [
            FloatingActionButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.change_circle_sharp))
          ],
        );
      },
    );

  }
  void _showDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Winner is : $winner!',style: TextStyles.myNewfont,),
          actions: [
            FloatingActionButton(
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.change_circle_sharp))
          ],
        );
      },
    );
    if (winner == 'O') {
      oScore += 1;
    } else if (winner == 'X') {
      xScore += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayxo[i] = '';
      }
      scoreDraw=0;
    });
  }
}
