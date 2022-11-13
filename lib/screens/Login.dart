import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/Team.dart';
import 'CriarConta.dart';
import 'GruposOuMataMata.dart';
import 'package:http/http.dart';


class Login extends StatefulWidget {
  static const String id = 'grupos_choice_screen';

  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();

}
FirebaseAuth auth = FirebaseAuth.instance;

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  String email = '';
  String senha = '';
  bool emailValid = false;
  bool senhaValid = false;
  bool LoginErrado = true;
  bool _senhaOculta = true;
  String loginText = 'Login';

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
          builder: (BuildContext context) => GruposOuMataMata(),
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
                    color: senhaValid && emailValid ? Colors.red[400] : Colors.grey,
                  ),
                  child: InkWell(
                    onTap: () {
                      senhaValid && emailValid ? signInWithEmailAndPassword() : null;
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
