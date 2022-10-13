import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/personal_card_screen.dart';

import '../componentes/rounded_button.dart';

class Dices extends StatefulWidget {
  static const String id = 'dices';

  @override
  State<Dices> createState() => _DicesState();
}

class _DicesState extends State<Dices> {
  AssetImage one = const AssetImage("assets/images/dice1.png");
  AssetImage two = const AssetImage("assets/images/dice2.png");
  AssetImage three = const AssetImage("assets/images/dice3.png");
  AssetImage four = const AssetImage("assets/images/dice4.png");
  AssetImage five = const AssetImage("assets/images/dice5.png");
  AssetImage six = const AssetImage("assets/images/dice6.png");

  AssetImage diceImage = const AssetImage("assets/images/dice1.png");
  AssetImage diceImage2 = const AssetImage("assets/images/dice1.png");


  @override
  void initState() {
    super.initState();
    setState(() {
      diceImage = one;
      diceImage2 = one;
    });
  }

  void rollDice() {
    int rnd = 1 + (Random().nextInt(6));

    AssetImage newImage = one;
    AssetImage newImage2 = one;
    int rnd2 = 1 + (Random().nextInt(6));


    switch (rnd) {
      case 1:
        newImage = one;
        break;
      case 2:
        newImage = two;
        break;
      case 3:
        newImage = three;
        break;
      case 4:
        newImage = four;
        break;
      case 5:
        newImage = five;
        break;
      case 6:
        newImage = six;
        break;
    }

    switch (rnd2) {
      case 1:
        newImage2 = one;
        break;
      case 2:
        newImage2 = two;
        break;
      case 3:
        newImage2 = three;
        break;
      case 4:
        newImage2 = four;
        break;
      case 5:
        newImage2 = five;
        break;
      case 6:
        newImage2 = six;
        break;
    }
    setState(() {
      diceImage = newImage;
      diceImage2 = newImage2;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
            child: Center(
              child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                              child: Expanded(
                                child: Image(
                                  image: diceImage,
                                  width: 200.0,
                                  height: 200.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Image(
                                image: diceImage2,
                                width: 200.0,
                                height: 200.0,
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                onPressed: rollDice,
                                child: const Text("Roll The Dice!!"),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),


              ),
            ),
      );
  }
}