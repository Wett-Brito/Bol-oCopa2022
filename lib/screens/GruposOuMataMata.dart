import 'package:flutter/material.dart';
import 'package:flutter_app/screens/ChoiceGrupos.dart';
import '../models/Team.dart';
import 'OitavasFinais.dart';

class GruposOuMataMata extends StatelessWidget {
  static const String id = 'grupos_choice_screen';

  const GruposOuMataMata({Key? key, required this.teams, required this.teamsMataMata}) : super(key: key);

  final List<Team> teams;
  final List<Team> teamsMataMata;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[400],
      body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Botao superior de fase de grupos
                Expanded(
                  flex: 4,
                  child: InkWell(
                    child: const Center(child: Text(style: TextStyle(color: Colors.white), 'FASE DE GRUPOS')),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: ((context) => ChoiceGrupos(teams: teams))));
                    },
                  ),
                ),
                // linha central para separar botoes
                Expanded(
                  flex: 1,
                  child: Divider(
                    color: Colors.black54,

                  ),
                ),
                // Botao inferior de mata mata
                Expanded(
                  flex: 4,
                  child: InkWell(
                    child: const Center(child: Text(style: TextStyle(color: Colors.white), 'MATA-MATA')),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OitavasFinais(teamsMataMata: teamsMataMata )
                          )
                      );
                    }
              ),
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
