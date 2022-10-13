import 'package:flutter/material.dart';
import 'package:flutter_app/quiz/components/quiz_button.dart';

import 'model/question_model.dart';

class FinishedQuizScreen extends StatelessWidget {
  static const String id = 'finished_quiz';

  const FinishedQuizScreen({Key? key, required this.arguments}) : super(key: key);

  final FinishedQuizScreenArguments arguments;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Parabens!'),
      ),
      body: Center(
        child: Text(
          'Sua pontuacao foi de ${arguments.score}',
        ),
      ),
    );
  }
}

class FinishedQuizScreenArguments {
  FinishedQuizScreenArguments({required this.score});

  int score;
}