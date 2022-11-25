import 'package:flutter/material.dart';

import '../models/Team.dart';
import 'Final.dart';
import 'Group.dart';

class SemiFinais extends StatelessWidget {
  static const String id = 'grupos_choice_screen';

  const SemiFinais({Key? key, required this.teamsMataMata}) : super(key: key);

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
                // Botão de Voltar
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
                // Texto Semi Finais
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
                  child: Text(style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Montserrat',
                    color: Colors.red[400]
                  ),'Semi Finais'),
                ),
                // Primeiro confronto
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 30),
                  child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.height / 5,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),

                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black45,
                          width: 1,

                      ),
                        borderRadius: BorderRadius.all(
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
                // Segundo confronto
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 5,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(5),

                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black45,
                          width: 1,

                        ),
                        borderRadius: BorderRadius.all(
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
                // Botão Proximo
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Container(
                    color: Colors.transparent,
                    height: 50,
                    width: 250,
                    child: Material(
                      borderRadius: BorderRadius.circular(30),
                      elevation: 20,
                      shadowColor: Colors.black,

                      child: InkWell(
                        onTap: (
                        () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Final(teamsMataMata: teamsMataMata,)
                              )
                          );
                        }
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 30),
                              child: Text(style: TextStyle(
                                color: Colors.black, fontFamily: 'Montserrat', fontSize: 32
                              ),
                                'Proximo'
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.arrow_forward, color: Colors.red[400],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
