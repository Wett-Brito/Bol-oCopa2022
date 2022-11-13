import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:firebase_database/firebase_database.dart';



import '../models/Team.dart';
import 'GruposOuMataMata.dart';
import 'Login.dart';
import 'OitavasFinais.dart';
import 'UsuarioCriado.dart';

class CriarConta extends StatefulWidget {
  static const String id = 'grupos_choice_screen';

  const CriarConta({Key? key}) : super(key: key);

  @override
  State<CriarConta> createState() => _CriarContaState();
}


FirebaseAuth auth = FirebaseAuth.instance;

class _CriarContaState extends State<CriarConta> {
  String nome = '';
  String telefone = '';
  String data_nasc = '';
  String email = '';
  String senha = '';
  String confirmarSenha = '';

  bool emailValid = true;
  bool firstEmail = true;
  bool _dataValida = true;
  bool _firstData = true;
  bool _telefoneValid = true;

  bool _confirmeSenhaOculta = true;
  bool _senhaOculta = true;

  bool _todosCamposCorretos = true;
  bool _senhasIguais = true;
  bool _senhaForte = true;

  String userId = '';

  FirebaseDatabase database = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {


    void getUserId() {
      FirebaseAuth.instance
          .authStateChanges()
          .listen((User? user) {
        if (user != null) {
          userId = user.uid;

        }
        http.post(
          Uri.parse('http://localhost:8080/notes'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            "Access-Control-Allow-Origin": "*",
            // "Access-Control-Allow-Credentials": true,
            "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
            "Access-Control-Allow-Methods": "POST, OPTIONS"

          },
          body: jsonEncode(<String, String>{
            'id': userId,
            'nome': nome,
            'telefone' : telefone,
            'datanasc' : data_nasc
          }),
        );
      });}

    Future<void> createUserWithEmailAndPassword() async{
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
        }
      } catch (e) {
        print(e);
      }
    }

    var maskFormatterPhone = MaskTextInputFormatter(
        mask: '+## (##) #####-####',
        filter: { "#": RegExp(r'[0-9]') },
        type: MaskAutoCompletionType.lazy
    );

    var maskFormatterData = MaskTextInputFormatter(
        mask: '##/##/####',
        filter: { "#": RegExp(r'[0-9]') },
        type: MaskAutoCompletionType.lazy
    );

    String toOriginalFormatString(DateTime dateTime) {
      final y = dateTime.year.toString().padLeft(4, '0');
      final m = dateTime.month.toString().padLeft(2, '0');
      final d = dateTime.day.toString().padLeft(2, '0');
      return "$y$m$d";
    }

    String toDateFormat(String dateTimeString) {
      final d = dateTimeString.substring(0, 2);
      final m = dateTimeString.substring(2, 4);
      final y = dateTimeString.substring(4);
      return "$y$m$d";
    }

    bool isValidDate(String input) {
      print(input.substring(0, 4));
      if(int.parse(input.substring(0, 4)) < 1920){
        return false;
      }
      final date = DateTime.parse(input);
      final originalFormatString = toOriginalFormatString(date);
      return input == originalFormatString;
    }

    bool camposValidos(){

      if(nome.isNotEmpty && telefone.isNotEmpty && (_dataValida && data_nasc.isNotEmpty) && (email.isNotEmpty && emailValid) && (_senhasIguais && senha.isNotEmpty && confirmarSenha.isNotEmpty && _senhaForte)){
        setState(() {
          _todosCamposCorretos = true;

        });
        return true;
      } else {
        setState(() {
          _todosCamposCorretos = false;
        });
        return false;
      }

    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //Botão de voltar Pagina
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15,  left: 15),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: ((context) => const Login())));
                      },
                      icon: const Icon(
                        Icons.arrow_back
                      ),
                    ),
                  ),
                ],
              ),
              //Texto de "Criar conta"
              Padding(
                padding: const EdgeInsets.only(top: 34),
                child: Text(
                  style: TextStyle(color: Colors.black, fontSize: 17, fontFamily: 'PoppinsBold', fontWeight: FontWeight.bold),
                    'Criar conta'
                ),
              ),
              //Input de Nome
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Container(
                  height: 43,
                  width: MediaQuery.of(context).size.width / 1.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                      border: Border.all(color: Colors.transparent)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      inputFormatters: [LengthLimitingTextInputFormatter(50)],
                        onChanged: (value) {
                          nome = value;
                          camposValidos();
                        },
                        decoration: const InputDecoration(border: InputBorder.none, hintText: 'Nome')),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 43,
                  width: MediaQuery.of(context).size.width / 1.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: Colors.transparent)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [maskFormatterPhone],
                        onChanged: (value) {
                            telefone = value;
                            if(value.length == 19){
                              _telefoneValid = false;
                              camposValidos();
                            } else if (value.length != 19 && !_telefoneValid){
                              _telefoneValid = true;
                              camposValidos();

                            }
                        },
                        decoration: const InputDecoration(border: InputBorder.none, hintText: 'Celular')
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 43,
                  width: MediaQuery.of(context).size.width / 1.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: _dataValida ? Colors.transparent : Colors.red)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                        inputFormatters: [maskFormatterData],
                        onChanged: (value) {

                          value = value.replaceAll("/", "");
                          data_nasc = value;
                        if(value.length == 8) {
                          _firstData = false;
                          value = toDateFormat(value);
                          if(!isValidDate(value)){
                            setState(() {
                              _dataValida = !_dataValida;
                            });

                          } else {
                            setState(() {

                              _dataValida = true;
                            });
                            camposValidos();
                          }

                        } else if(value.length != 8 && !_firstData){
                          _firstData = true;
                          camposValidos();
                        }
                        },
                        decoration: const InputDecoration(border: InputBorder.none, hintText: 'Data nasc.')),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 43,
                  width: MediaQuery.of(context).size.width / 1.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: emailValid ? Colors.transparent : Colors.red)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        inputFormatters: [LengthLimitingTextInputFormatter(50)],
                        onChanged: (value) {
                          email = value;

                          if(value.isNotEmpty){
                            if(value.substring(1, value.length).contains('@') && value.substring(value.indexOf("@"), value.length).contains('.') && !value.endsWith('.')){
                              // firstEmail = false;
                              setState(() {
                                emailValid = true;
                              });
                                camposValidos();


                            } else {
                              setState(() {
                                emailValid = false;

                              });
                                camposValidos();
                            }
                          }
                        },
                        decoration: const InputDecoration(border: InputBorder.none, hintText: 'Email')),
                  ),
                ),
              ),
              // Input Senha
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 43,
                  width: MediaQuery.of(context).size.width / 1.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: _senhasIguais && _senhaForte ? Colors.transparent : Colors.red)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        obscureText: _senhaOculta,
                        enableSuggestions: false,
                        autocorrect: false,
                        inputFormatters: [LengthLimitingTextInputFormatter(30)],
                        onChanged: (value) {
                          senha = value;
                          if(value.length > 6) {
                            _senhaForte = true;
                            if ((confirmarSenha.isNotEmpty && senha.isNotEmpty) &&
                                confirmarSenha == senha) {
                              setState(() {
                                _senhasIguais = true;
                              });
                            } else if ((confirmarSenha.isNotEmpty &&
                                senha.isNotEmpty) && confirmarSenha != senha &&
                                _senhasIguais) {
                              setState(() {
                                _senhasIguais = !_senhasIguais;
                              });
                            }
                          } else {
                            _senhaForte = false;
                          }

                          camposValidos();

                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Senha',
                            suffixIcon: IconButton(
                              icon: Icon(
                                  _senhaOculta ? Icons.visibility : Icons.visibility_off
                              ),
                              onPressed: (() {
                                setState(() {
                                  _senhaOculta = !_senhaOculta;
                                });
                              }),
                            )
                        )
                    ),
                  ),
                ),
              ),
              // Input Confirmar Senha
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 43,
                  width: MediaQuery.of(context).size.width / 1.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(color: _senhasIguais ? Colors.transparent : Colors.red)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: _confirmeSenhaOculta,
                        enableSuggestions: false,
                        autocorrect: false,
                        inputFormatters: [LengthLimitingTextInputFormatter(30)],
                        onChanged: (value) {
                          confirmarSenha = value;

                          if((confirmarSenha.isNotEmpty && senha.isNotEmpty) && confirmarSenha == senha){
                            setState(() {
                              _senhasIguais = true;

                            });
                          }else if((confirmarSenha.isNotEmpty && senha.isNotEmpty) && confirmarSenha != senha && _senhasIguais){
                            setState(() {
                              _senhasIguais = !_senhasIguais;

                            });
                          }

                          camposValidos();
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirme senha',
                            suffixIcon: IconButton(
                              // splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              icon: Icon(
                                  _confirmeSenhaOculta ? Icons.visibility : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _confirmeSenhaOculta = !_confirmeSenhaOculta;
                                    });
                                  },
                            )
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 7, top: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'PoppinsRegular',
                      fontWeight: FontWeight.w100,
                    ),'A senha deve contar mais de 6 caracteres'),
                  ],
                ),
              ),
              //Botao de logar
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: camposValidos() ? Colors.red[400] : Colors.grey,
                  ),
                  child: InkWell(
                    onTap: () {
                      createUserWithEmailAndPassword();
                      getUserId();

                      Navigator.pushReplacement<void, void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const UsuarioCriado(),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 43,
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: const Center(
                        child: Text(style:
                          TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'PoppinsBold',
                            fontWeight: FontWeight.bold,
                          ), 'Registrar'
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
