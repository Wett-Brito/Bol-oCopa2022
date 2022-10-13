import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/screens/personal_card_screen.dart';


class QuizButton extends StatelessWidget {
  static const String id = 'quiz';

  const QuizButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key : key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Material(
        color: Colors.teal,
        elevation: 8,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}