import 'package:flutter/material.dart';
import 'package:flutter_app/quiz/components/quiz_button.dart';

import 'FinishedQuizScreen.dart';
import 'model/question_model.dart';

class QuizScreen extends StatefulWidget {
  static const String id = 'quiz';

  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  List<QuestionModel> questions = [];
  var questionsIndex = 0;
  var score = 0;

  List<QuestionModel> loadQuestions(){
    return[
    QuestionModel(question: 'Qual é o melhor presidente dessa eleição', options: ['Lula', 'Bolsonaro', 'Ciro', 'Tebet'], answer: 0)
    ];
  }

  void onOptionPressed(int selectedOption){
    final currentQuestion = questions[questionsIndex];

    if(selectedOption == currentQuestion.answer){
      score++;
    }

    goToNextQuestion();
  }

  void goToNextQuestion() {
    if (questionsIndex == questions.length - 1) {
      Navigator.pushReplacementNamed(
        context, FinishedQuizScreen.id, arguments: FinishedQuizScreenArguments(
        score: score,
      ),);
    } else {
      setState(() {
        questionsIndex++;
      });
    }
  }
  @override
  void initState(){
    super.initState();
    questions = loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionsIndex];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(currentQuestion.question),
              const SizedBox(height: 32),
              ListView.separated(
                itemCount: currentQuestion.options.length,
                shrinkWrap: true,
              separatorBuilder: (context, index)  =>
                  const SizedBox(height: 10),
              itemBuilder: (context, index) {
                  return QuizButton(
                      text: currentQuestion.options[index],
                      onPressed: () {
                        onOptionPressed(index);
                      }
                  );
              }),
            ],
          ),
        ),
      )
    );
  }
}

