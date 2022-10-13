import 'package:flutter/material.dart';
import 'package:flutter_app/screens/personal_card_screen.dart';

import '../componentes/rounded_button.dart';

class MenuScreen extends StatelessWidget {
  static const String id = 'menu_screen';

  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              const Text(
                'Menu',
                style: TextStyle(
                  fontFamily: 'Nabla',
                  color: Colors.pink,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              RoundedButton(
                icon: Icons.person,
                text: 'Cartão pessoal',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    PersonalCardScreen.id,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
