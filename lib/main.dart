import 'package:flutter/material.dart';
import 'package:flutter_app/quiz/FinishedQuizScreen.dart';
import 'package:flutter_app/quiz/components/quiz_button.dart';
import 'package:flutter_app/quiz/quizScreen.dart';
import 'package:flutter_app/screens/EachGroup.dart';
import 'package:flutter_app/screens/EachGroup.dart';
import 'package:flutter_app/screens/Final.dart';
import 'package:flutter_app/screens/OitavasFinais.dart';
import 'package:flutter_app/screens/dices.dart';
import 'package:flutter_app/screens/GruposOuMataMata.dart';
import 'package:flutter_app/screens/menu_screen.dart';
import 'package:flutter_app/screens/personal_card_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.yellow,
    //   ),
    //   initialRoute: GruposChoiceScreen.id,
    //   routes: {
    //     QuizScreen.id: (context) => const QuizScreen(),
    //     FinishedQuizScreen.id: (context) => FinishedQuizScreen(
    //       arguments: ModalRoute.of(context)?.settings.arguments as FinishedQuizScreenArguments)
    //
    //   },
    // );

    return MaterialApp(
      title: 'Dice Roller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: GruposOuMataMata(),
    );
  }
}


