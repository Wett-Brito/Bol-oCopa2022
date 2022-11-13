import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/Team.dart';
import 'package:http/http.dart';

import 'ChoiceGrupos.dart';
import 'Login.dart';
import 'OitavasFinais.dart';


class GruposOuMataMata extends StatefulWidget {
  static const String id = 'grupos_choice_screen';

  const GruposOuMataMata({Key? key}) : super(key: key);

  @override
  State<GruposOuMataMata> createState() => _GruposOuMataMataState();

}

FirebaseAuth auth = FirebaseAuth.instance;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class _GruposOuMataMataState extends State<GruposOuMataMata> {
  @override
  void initState() {
    super.initState();
    HttpOverrides.global = MyHttpOverrides();
    getTimes();
  }

  bool _permitirLogin = false;
  List<Team> teams = [];
  List<Team> teamsMataMata = [];

  Future<void> wait() async {
    await Future.delayed(const Duration(seconds: 4), () {
    });
  }

  Future<void> getTimes() async {

    try{
      final responseLogin = await Client().post(
          Uri.parse('http://api.cup2022.ir/api/v1/user/login'),
          headers: {
            'Content-Type': 'application/json',
          },body: jsonEncode({
        "email": 'wellingtonsantosbritos@gmail.com',
        "password": "123456789"
      }));

      _permitirLogin = true;

      setState(() {
        _permitirLogin;
      });

      String token = jsonDecode(responseLogin.body)['data']['token'].toString();

      final response = await Client().get(
          Uri.parse('http://api.cup2022.ir/api/v1/standings'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            "Access-Control-Allow-Origin": "*",
            "Authorization" : "Bearer $token"
          });


      final responseJson = jsonDecode(response.body);

      List<String> grupoAtime1 = [responseJson['data'][0]['teams'][0]['team_id'], responseJson['data'][0]['teams'][0]['name_en'], responseJson['data'][0]['teams'][0]['flag'], responseJson['data'][0]['teams'][0]['pts']];
      List<String> grupoAtime2 = [responseJson['data'][0]['teams'][1]['team_id'], responseJson['data'][0]['teams'][1]['name_en'], responseJson['data'][0]['teams'][1]['flag'], responseJson['data'][0]['teams'][1]['pts']];
      List<String> grupoAtime3 = [responseJson['data'][0]['teams'][2]['team_id'], responseJson['data'][0]['teams'][2]['name_en'], responseJson['data'][0]['teams'][2]['flag'], responseJson['data'][0]['teams'][2]['pts']];
      List<String> grupoAtime4 = [responseJson['data'][0]['teams'][3]['team_id'], responseJson['data'][0]['teams'][3]['name_en'], responseJson['data'][0]['teams'][3]['flag'], responseJson['data'][0]['teams'][3]['pts']];

      List<String> grupoBtime1 = [responseJson['data'][1]['teams'][0]['team_id'], responseJson['data'][1]['teams'][0]['name_en'], 'https://img.freepik.com/premium-vector/iran-flag-vector_671352-96.jpg', responseJson['data'][0]['teams'][0]['pts']];
      List<String> grupoBtime2 = [responseJson['data'][1]['teams'][1]['team_id'], responseJson['data'][1]['teams'][1]['name_en'], responseJson['data'][1]['teams'][1]['flag'], responseJson['data'][1]['teams'][1]['pts']];
      List<String> grupoBtime3 = [responseJson['data'][1]['teams'][2]['team_id'], responseJson['data'][1]['teams'][2]['name_en'], responseJson['data'][1]['teams'][2]['flag'], responseJson['data'][1]['teams'][2]['pts']];
      List<String> grupoBtime4 = [responseJson['data'][1]['teams'][3]['team_id'], responseJson['data'][1]['teams'][3]['name_en'], responseJson['data'][1]['teams'][3]['flag'], responseJson['data'][1]['teams'][3]['pts']];

      List<String> grupoCtime1 = [responseJson['data'][2]['teams'][0]['team_id'], responseJson['data'][2]['teams'][0]['name_en'], responseJson['data'][2]['teams'][0]['flag'], responseJson['data'][2]['teams'][0]['pts']];
      List<String> grupoCtime2 = [responseJson['data'][2]['teams'][1]['team_id'], responseJson['data'][2]['teams'][1]['name_en'], responseJson['data'][2]['teams'][1]['flag'], responseJson['data'][2]['teams'][1]['pts']];
      List<String> grupoCtime3 = [responseJson['data'][2]['teams'][2]['team_id'], responseJson['data'][2]['teams'][2]['name_en'], responseJson['data'][2]['teams'][2]['flag'], responseJson['data'][2]['teams'][2]['pts']];
      List<String> grupoCtime4 = [responseJson['data'][2]['teams'][3]['team_id'], responseJson['data'][2]['teams'][3]['name_en'], responseJson['data'][2]['teams'][3]['flag'], responseJson['data'][2]['teams'][3]['pts']];

      List<String> grupoDtime1 = [responseJson['data'][3]['teams'][0]['team_id'], responseJson['data'][3]['teams'][0]['name_en'], responseJson['data'][3]['teams'][0]['flag'], responseJson['data'][3]['teams'][0]['pts']];
      List<String> grupoDtime2 = [responseJson['data'][3]['teams'][1]['team_id'], responseJson['data'][3]['teams'][1]['name_en'], responseJson['data'][3]['teams'][1]['flag'], responseJson['data'][3]['teams'][1]['pts']];
      List<String> grupoDtime3 = [responseJson['data'][3]['teams'][2]['team_id'], responseJson['data'][3]['teams'][2]['name_en'], responseJson['data'][3]['teams'][2]['flag'], responseJson['data'][3]['teams'][2]['pts']];
      List<String> grupoDtime4 = [responseJson['data'][3]['teams'][3]['team_id'], responseJson['data'][3]['teams'][3]['name_en'], responseJson['data'][3]['teams'][3]['flag'], responseJson['data'][3]['teams'][3]['pts']];

      List<String> grupoEtime1 = [responseJson['data'][4]['teams'][0]['team_id'], responseJson['data'][4]['teams'][0]['name_en'], responseJson['data'][4]['teams'][0]['flag'], responseJson['data'][4]['teams'][0]['pts']];
      List<String> grupoEtime2 = [responseJson['data'][4]['teams'][1]['team_id'], responseJson['data'][4]['teams'][1]['name_en'], responseJson['data'][4]['teams'][1]['flag'], responseJson['data'][4]['teams'][1]['pts']];
      List<String> grupoEtime3 = [responseJson['data'][4]['teams'][2]['team_id'], responseJson['data'][4]['teams'][2]['name_en'], responseJson['data'][4]['teams'][2]['flag'], responseJson['data'][4]['teams'][2]['pts']];
      List<String> grupoEtime4 = [responseJson['data'][4]['teams'][3]['team_id'], responseJson['data'][4]['teams'][3]['name_en'], responseJson['data'][4]['teams'][3]['flag'], responseJson['data'][4]['teams'][3]['pts']];

      List<String> grupoFtime1 = [responseJson['data'][5]['teams'][0]['team_id'], responseJson['data'][5]['teams'][0]['name_en'], responseJson['data'][5]['teams'][0]['flag'], responseJson['data'][5]['teams'][0]['pts']];
      List<String> grupoFtime2 = [responseJson['data'][5]['teams'][1]['team_id'], responseJson['data'][5]['teams'][1]['name_en'], responseJson['data'][5]['teams'][1]['flag'], responseJson['data'][5]['teams'][1]['pts']];
      List<String> grupoFtime3 = [responseJson['data'][5]['teams'][2]['team_id'], responseJson['data'][5]['teams'][2]['name_en'], responseJson['data'][5]['teams'][2]['flag'], responseJson['data'][5]['teams'][2]['pts']];
      List<String> grupoFtime4 = [responseJson['data'][5]['teams'][3]['team_id'], responseJson['data'][5]['teams'][3]['name_en'], responseJson['data'][5]['teams'][3]['flag'], responseJson['data'][5]['teams'][3]['pts']];

      List<String> grupoGtime1 = [responseJson['data'][6]['teams'][0]['team_id'], responseJson['data'][6]['teams'][0]['name_en'], responseJson['data'][6]['teams'][0]['flag'], responseJson['data'][6]['teams'][0]['pts']];
      List<String> grupoGtime2 = [responseJson['data'][6]['teams'][1]['team_id'], responseJson['data'][6]['teams'][1]['name_en'], responseJson['data'][6]['teams'][1]['flag'], responseJson['data'][6]['teams'][1]['pts']];
      List<String> grupoGtime3 = [responseJson['data'][6]['teams'][2]['team_id'], responseJson['data'][6]['teams'][2]['name_en'], responseJson['data'][6]['teams'][2]['flag'], responseJson['data'][6]['teams'][2]['pts']];
      List<String> grupoGtime4 = [responseJson['data'][6]['teams'][3]['team_id'], responseJson['data'][6]['teams'][3]['name_en'], responseJson['data'][6]['teams'][3]['flag'], responseJson['data'][6]['teams'][3]['pts']];

      List<String> grupoHtime1 = [responseJson['data'][7]['teams'][0]['team_id'], responseJson['data'][7]['teams'][0]['name_en'], responseJson['data'][7]['teams'][0]['flag'], responseJson['data'][7]['teams'][0]['pts']];
      List<String> grupoHtime2 = [responseJson['data'][7]['teams'][1]['team_id'], responseJson['data'][7]['teams'][1]['name_en'], responseJson['data'][7]['teams'][1]['flag'], responseJson['data'][7]['teams'][1]['pts']];
      List<String> grupoHtime3 = [responseJson['data'][7]['teams'][2]['team_id'], responseJson['data'][7]['teams'][2]['name_en'], responseJson['data'][7]['teams'][2]['flag'], responseJson['data'][7]['teams'][2]['pts']];
      List<String> grupoHtime4 = [responseJson['data'][7]['teams'][3]['team_id'], responseJson['data'][7]['teams'][3]['name_en'], responseJson['data'][7]['teams'][3]['flag'], responseJson['data'][7]['teams'][3]['pts']];

      Team t1a = Team(team_id: grupoAtime1[0], name_en: grupoAtime1[1], flag: grupoAtime1[2], pts: grupoAtime1[3]);
      Team t2a = Team(team_id: grupoAtime2[0], name_en: grupoAtime2[1], flag: grupoAtime2[2], pts: grupoAtime2[3]);
      Team t3a = Team(team_id: grupoAtime3[0], name_en: grupoAtime3[1], flag: grupoAtime3[2], pts: grupoAtime3[3]);
      Team t4a = Team(team_id: grupoAtime4[0], name_en: grupoAtime4[1], flag: grupoAtime4[2], pts: grupoAtime4[3]);

      Team t1b = Team(team_id: grupoBtime1[0], name_en: grupoBtime1[1], flag: grupoBtime1[2], pts: grupoBtime1[3]);
      Team t2b = Team(team_id: grupoBtime2[0], name_en: grupoBtime2[1], flag: grupoBtime2[2], pts: grupoBtime2[3]);
      Team t3b = Team(team_id: grupoBtime3[0], name_en: grupoBtime3[1], flag: grupoBtime3[2], pts: grupoBtime3[3]);
      Team t4b = Team(team_id: grupoBtime4[0], name_en: grupoBtime4[1], flag: grupoBtime4[2], pts: grupoBtime4[3]);

      Team t1c = Team(team_id: grupoCtime1[0], name_en: grupoCtime1[1], flag: grupoCtime1[2], pts: grupoCtime1[3]);
      Team t2c = Team(team_id: grupoCtime2[0], name_en: grupoCtime2[1], flag: grupoCtime2[2], pts: grupoCtime2[3]);
      Team t3c = Team(team_id: grupoCtime3[0], name_en: grupoCtime3[1], flag: grupoCtime3[2], pts: grupoCtime3[3]);
      Team t4c = Team(team_id: grupoCtime4[0], name_en: grupoCtime4[1], flag: grupoCtime4[2], pts: grupoCtime4[3]);

      Team t1d = Team(team_id: grupoDtime1[0], name_en: grupoDtime1[1], flag: grupoDtime1[2], pts: grupoDtime1[3]);
      Team t2d = Team(team_id: grupoDtime2[0], name_en: grupoDtime2[1], flag: grupoDtime2[2], pts: grupoDtime2[3]);
      Team t3d = Team(team_id: grupoDtime3[0], name_en: grupoDtime3[1], flag: grupoDtime3[2], pts: grupoDtime3[3]);
      Team t4d = Team(team_id: grupoDtime4[0], name_en: grupoDtime4[1], flag: grupoDtime4[2], pts: grupoDtime4[3]);

      Team t1e = Team(team_id: grupoEtime1[0], name_en: grupoEtime1[1], flag: grupoEtime1[2], pts: grupoEtime1[3]);
      Team t2e = Team(team_id: grupoEtime2[0], name_en: grupoEtime2[1], flag: grupoEtime2[2], pts: grupoEtime2[3]);
      Team t3e = Team(team_id: grupoEtime3[0], name_en: grupoEtime3[1], flag: grupoEtime3[2], pts: grupoEtime3[3]);
      Team t4e = Team(team_id: grupoEtime4[0], name_en: grupoEtime4[1], flag: grupoEtime4[2], pts: grupoEtime4[3]);

      Team t1f = Team(team_id: grupoFtime1[0], name_en: grupoFtime1[1], flag: grupoFtime1[2], pts: grupoFtime1[3]);
      Team t2f = Team(team_id: grupoFtime2[0], name_en: grupoFtime2[1], flag: grupoFtime2[2], pts: grupoFtime2[3]);
      Team t3f = Team(team_id: grupoFtime3[0], name_en: grupoFtime3[1], flag: grupoFtime3[2], pts: grupoFtime3[3]);
      Team t4f = Team(team_id: grupoFtime4[0], name_en: grupoFtime4[1], flag: grupoFtime4[2], pts: grupoFtime4[3]);

      Team t1g = Team(team_id: grupoGtime1[0], name_en: grupoGtime1[1], flag: grupoGtime1[2], pts: grupoGtime1[3]);
      Team t2g = Team(team_id: grupoGtime2[0], name_en: grupoGtime2[1], flag: grupoGtime2[2], pts: grupoGtime2[3]);
      Team t3g = Team(team_id: grupoGtime3[0], name_en: grupoGtime3[1], flag: grupoGtime3[2], pts: grupoGtime3[3]);
      Team t4g = Team(team_id: grupoGtime4[0], name_en: grupoGtime4[1], flag: grupoGtime4[2], pts: grupoGtime4[3]);

      Team t1h = Team(team_id: grupoHtime1[0], name_en: grupoHtime1[1], flag: grupoHtime1[2], pts: grupoHtime1[3]);
      Team t2h = Team(team_id: grupoHtime2[0], name_en: grupoHtime2[1], flag: grupoHtime2[2], pts: grupoHtime2[3]);
      Team t3h = Team(team_id: grupoHtime3[0], name_en: grupoHtime3[1], flag: grupoHtime3[2], pts: grupoHtime3[3]);
      Team t4h = Team(team_id: grupoHtime4[0], name_en: grupoHtime4[1], flag: grupoHtime4[2], pts: grupoHtime4[3]);

      teams = [t1a, t2a, t3a, t4a,
        t1b, t2b, t3b, t4b,
        t1c, t2c, t3c, t4c,
        t1d, t2d, t3d, t4d,
        t1e, t2e, t3e, t4e,
        t1f, t2f, t3f, t4f,
        t1g, t2g, t3g, t4g,
        t1h, t2h, t3h, t4h];

      Team timePadrao = Team(team_id: '0', name_en: 'Sem Definição', flag: 'https://img.freepik.com/vetores-premium/copa-do-mundo-fifa-qatar-2022-logo-estilizado-vector-ilustracao-isolada-com-futebol_633888-126.jpg?w=2000', pts: '0');
      Team timeMaisForte = timePadrao;
      Team timeMaisForte2 = timePadrao;

      //Pegando todos times de 4 em 4
      for(int i = 0; i != 32 ; i++){

        if (int.parse(teams[i].pts) >= int.parse(timeMaisForte.pts) && int.parse(teams[i].pts) > 0) {
          timeMaisForte2 = timeMaisForte;
          timeMaisForte = teams[i];
        }
        else if (int.parse(teams[i].pts) >= int.parse(timeMaisForte2.pts) && int.parse(teams[i].pts) > 0) {
          timeMaisForte2 = teams[i];
        }


        if(i % 4 == 0){
          teamsMataMata.add(timeMaisForte);
          teamsMataMata.add(timeMaisForte2);
          timeMaisForte = timePadrao;
          timeMaisForte2 = timePadrao;
        }

      }
    } catch(e){
      _permitirLogin = false;
    }

  }

  @override
  Widget build(BuildContext context) {
    if (!_permitirLogin) {
      return Scaffold(
          backgroundColor: Colors.red[400],
          body: SafeArea(
              child: Center(
                child: Image.network("https://mir-s3-cdn-cf.behance.net/project_modules/disp/3f3a3831234507.564a1d2338123.gif", color: Color.fromRGBO(255, 255, 255, 0.5), colorBlendMode: BlendMode.modulate),
              )

          )
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.red[400],
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Login()
                                  )
                              )
                          );
                        },
                        icon: const Icon(Icons.logout, color: Color.fromRGBO(255, 255, 255, 0.9)),
                      )
                    ],
                  ),
                ),
                // Botao superior de fase de grupos
                Expanded(
                  flex: 4,
                  child: InkWell(
                    child: const Center(child: Text(
                        style: TextStyle(color: Colors.white),
                        'FASE DE GRUPOS')),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: ((context) =>
                              ChoiceGrupos(teams: teams))));
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
                      child: const Center(child: Text(
                          style: TextStyle(color: Colors.white), 'MATA-MATA')),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    OitavasFinais(teamsMataMata: teamsMataMata)
                            )
                        );
                      }
                  ),
                )
              ],
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
}
