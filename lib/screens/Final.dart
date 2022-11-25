import 'package:flutter/material.dart';

import '../models/Team.dart';
import 'Group.dart';

class Final extends StatelessWidget {
  static const String id = 'grupos_choice_screen';

  const Final({Key? key, required this.teamsMataMata}) : super(key: key);

  final List<Team> teamsMataMata;
  @override
  Widget build(BuildContext context) {

    Team timePadrao = Team(team_id: '0', name_en: 'Sem Definição', flag: 'https://img.freepik.com/vetores-premium/copa-do-mundo-fifa-qatar-2022-logo-estilizado-vector-ilustracao-isolada-com-futebol_633888-126.jpg?w=2000', pts: '0');

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: <Widget> [
              Column(
              children: [
                // Botão voltar
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Container(
                        child: InkWell(
                          onTap: (
                          () {
                            Navigator.pop(context);
                          }),
                          child: const Icon(
                            Icons.arrow_back, color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // Texto Final
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
                  child: Text(style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Montserrat',
                    color: Colors.red[400]
                  ),'Final'),
                ),
                // Unico Confronto
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 30),
                  child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 5,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(5),

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black45,
                          width: 1,

                      ),
                        borderRadius: const BorderRadius.all(
                            Radius.circular(10)
                        )
                      ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(

                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Material(
                                    borderRadius: BorderRadius.circular(90),
                                    child: CircleAvatar(backgroundImage: NetworkImage(timePadrao.flag)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(timePadrao.name_en),
                              ),
                            ],
                          ),

                          Text(style: TextStyle(
                            fontSize: 64, color: Colors.red[400],
                          ),'X'),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Material(
                                  borderRadius: BorderRadius.circular(90),
                                  child: CircleAvatar(backgroundImage: NetworkImage(timePadrao.flag))
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(timePadrao.name_en),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
