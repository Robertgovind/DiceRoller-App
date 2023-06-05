import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 15, 217, 210),
        appBar: AppBar(
          title: Center(
              child: Text(
            'Dicee',
            style: TextStyle(color: Colors.red),
          )),
          backgroundColor: Color.fromARGB(255, 27, 230, 216),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 4;
  int rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    void dFaceChanger() {
      setState(() {
        rightDiceNumber = Random().nextInt(6) + 1;
        leftDiceNumber = Random().nextInt(6) + 1;
      });
    }

    return Center(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              iconSize: 150,
              icon: Image.asset("images/dice$leftDiceNumber.png"),
              onPressed: () {
                setState(() {
                  dFaceChanger();
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              iconSize: 150,
              icon: Image.asset("images/dice$rightDiceNumber.png"),
              onPressed: () {
                dFaceChanger();
              },
            ),
          ),
        ],
      ),
    );
  }
}
