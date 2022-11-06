import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/Team.dart';
import 'CriarConta.dart';
import 'GruposOuMataMata.dart';
import 'package:http/http.dart';


class Inscricao extends StatefulWidget {
  static const String id = 'grupos_choice_screen';

  const Inscricao({Key? key}) : super(key: key);

  @override
  State<Inscricao> createState() => _InscricaoState();

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

class _InscricaoState extends State<Inscricao> {
  @override
  void initState() {
    super.initState();
    HttpOverrides.global = MyHttpOverrides();
    getTimes();
  }

  String email = '';
  String senha = '';
  bool emailValid = false;
  bool senhaValid = false;
  bool LoginErrado = true;
  bool _senhaOculta = true;
  bool _permitirLogin = false;
  String loginText = 'Login';

  Future<void> wait() async {
    await Future.delayed(const Duration(seconds: 4), () {
    });
  }

    Future<void> createUserWithEmailAndPassword() async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print('Usuario e senha vazios');
      }
    } catch (e) {
      print(e);
    }
  }

  void signInWithEmailAndPassword() async{
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(

          email: email,
          password: senha
      );

      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => GruposOuMataMata(teams: teams, teamsMataMata: teamsMataMAta,),
        ),
      );

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      LoginErrado = false;
      setState(() {

      });
    }
  }


  List<Team> teams = [];
  List<Team> teamsMataMAta = [];

  Future<void> getTimes() async {

    print('Chegou aqudsadsadsai');

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

      String token = jsonDecode(responseLogin.body)['data']['token'].toString();


      final response = await Client().get(
          Uri.parse('http://api.cup2022.ir/api/v1/standings'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            "Access-Control-Allow-Origin": "*",
            "Authorization" : "Bearer $token"
          });


      final responseJson = jsonDecode(response.body);

      if(responseJson.toString().isEmpty){
        print('Esta vazio');
      } else {
        print('Não esta vazio');
      }

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
            teamsMataMAta.add(timeMaisForte);
            teamsMataMAta.add(timeMaisForte2);
            timeMaisForte = timePadrao;
            timeMaisForte2 = timePadrao;
          }

      }
    } catch(e){
      print('Teste teste');
      _permitirLogin = false;
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Imagem Principal da tela de login
              Container(
                  padding: EdgeInsets.all(40),
                  child: Image(image: AssetImage('assets/images/Front2.png'))
              ),
              //Texto de "Digite seu email e senha"
              Text(
                style: TextStyle(color: Colors.red[400], fontSize: 17, fontFamily: 'PoppinsBold', fontWeight: FontWeight.bold),
                  'Digite seu email e senha'
              ),
              //Input de email
              Padding(
                padding: const EdgeInsets.only(top: 34),
                child: Container(
                  height: 43,
                  width: MediaQuery.of(context).size.width / 1.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                      border: Border.all(color: LoginErrado ? Colors.transparent : Colors.red)


                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        onChanged: (value) {
                          email = value;
                          if(value.isEmpty){
                            LoginErrado = true;
                            setState(() {

                            });
                          } else if(value.isNotEmpty){
                            emailValid = true;
                            setState(() {

                            });
                          } else if(emailValid == true && value.isEmpty){
                            emailValid = false;
                            setState(() {

                            });
                          }
                        },
                        decoration: InputDecoration(border: InputBorder.none, hintText: 'Email')),
                  ),
                ),
              ),
              //Input de senha
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: Container(
                  height: 43,
                  width: MediaQuery.of(context).size.width / 1.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: LoginErrado ? Colors.transparent : Colors.red)

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        obscureText: _senhaOculta,
                        enableSuggestions: false,
                        autocorrect: false,
                        onChanged: (value) {
                          senha = value;
                          if(value.isEmpty){
                            LoginErrado = true;
                            setState(() {

                            });
                          } else if(value.isNotEmpty){
                            senhaValid = true;
                            setState(() {

                            });
                          } else if(senhaValid == true && value.isEmpty){
                            senhaValid = false;
                            setState(() {

                            });}
                        },
                        decoration: InputDecoration(border: InputBorder.none, hintText: 'Senha',
                            suffixIcon: IconButton(icon: Icon(_senhaOculta ? Icons.visibility : Icons.visibility_off), onPressed: () {  setState(() {
                              _senhaOculta = !_senhaOculta;
                            }); },))),
                  ),
                ),
              ),
              //Botao de logar
              Padding(
                padding: const EdgeInsets.only(top: 30.0),


                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: senhaValid && emailValid && _permitirLogin ? Colors.red[400] : Colors.grey,
                  ),
                  child: InkWell(
                    onTap: () {
                      senhaValid && emailValid && _permitirLogin ? signInWithEmailAndPassword() : null;
                      wait();
                      if(!_permitirLogin){
                        loginText = 'API FORA';
                      } else {
                        loginText = 'Login';
                      }
                      setState(() {

                      });
                    },
                    child: SizedBox(
                      height: 43,
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: Center(
                        child: Text(style:
                          TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'PoppinsBold',
                            fontWeight: FontWeight.bold,
                          ), loginText
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              //Linha de separação com texto 'ou'
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 30, left: MediaQuery.of(context).size.width / 10),
                        child: Divider(
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Container(
                      child: const Text(style: TextStyle(
                        fontFamily: 'PoppinsRegular',
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Color(0xFF757171)
                      ),
                        'or'
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20, left: MediaQuery.of(context).size.width / 30),
                        child: const Divider(
                          color: Colors.black38,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Link para criar conta
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: InkWell(
                  child: RichText(
                    text: const TextSpan(
                      text: 'Ainda não tem conta ?',
                          style: TextStyle(
                        color: Color(0xA6000000),
                      fontSize: 12,
                      fontFamily: 'PoppinsRegular',
                      fontWeight: FontWeight.normal
                  ),
                      children: [
                        TextSpan(
                          text: ' Criar conta',
                          style: TextStyle(
                              color: Color(0xA6000000),
                              fontSize: 12,
                              fontFamily: 'PoppinsRegular',
                              fontWeight: FontWeight.bold
                          ),

                        )
                      ]
                    ),
                  ),


                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: ((context) => CriarConta())));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
