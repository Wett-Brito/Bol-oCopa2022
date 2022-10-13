import 'package:flutter/material.dart';
import 'package:flutter_app/screens/ChoiceGrupos.dart';
import 'package:flutter_app/screens/personal_card_screen.dart';

import '../componentes/rounded_button.dart';
import 'OitavasFinais.dart';

class GruposOuMataMata extends StatelessWidget {
  static const String id = 'grupos_choice_screen';

  const GruposOuMataMata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [InkWell(
                child: const Text(style: TextStyle(color: Colors.white), 'FASE DE GRUPOS'),
                onTap: () {
                  Navigator.push(
                      context, 
                      MaterialPageRoute(builder: ((context) => const ChoiceGrupos())));
                },
              ),
                Padding(
                  padding: const EdgeInsets.only(top: 60, bottom: 60),
                  child: Container(
                    child: FittedBox(
                      child: Image(
                          image: const AssetImage("assets/images/line.png")
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                InkWell(
                  child: const Text(style: TextStyle(color: Colors.white), 'MATA-MATA'),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OitavasFinais()
                        )
                    );
                  }
              )],
            ),
          ),



        //
        // child: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       SizedBox(height: 16),
        //       const Text(
        //         'Menu',
        //         style: TextStyle(
        //           fontFamily: 'Nabla',
        //           color: Colors.pink,
        //           fontSize: 30,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       SizedBox(height: 20),
        //       RoundedButton(
        //         icon: Icons.person,
        //         text: 'Cartão pessoal',
        //         onTap: () {
        //           Navigator.pushNamed(
        //             context,
        //             PersonalCardScreen.id,
        //           );
        //         },
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
