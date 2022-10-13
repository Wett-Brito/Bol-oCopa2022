import 'package:flutter/material.dart';
import 'package:flutter_app/screens/GruposOuMataMata.dart';
import 'package:flutter_app/screens/SemiFinais.dart';
import 'package:flutter_app/screens/personal_card_screen.dart';

import '../componentes/rounded_button.dart';
import 'EachGroup.dart';

class Final extends StatefulWidget {
  static const String id = 'grupos_choice_screen';

  const Final({Key? key}) : super(key: key);

  @override
  State<Final> createState() => _FinalState();
}

class _FinalState extends State<Final> {

  bool _hasBeenPressedTeam1 = false;
  bool _hasBeenPressedTeam2 = false;
  bool _hasBeenPressedTeam3 = false;
  bool _hasBeenPressedTeam4 = false;
  bool _hasBeenPressedTeam5 = false;
  bool _hasBeenPressedTeam6 = false;
  bool _hasBeenPressedTeam7 = false;
  bool _hasBeenPressedTeam8 = false;
  bool _hasBeenPressedTeam9 = false;
  bool _hasBeenPressedTeam10 = false;
  bool _hasBeenPressedTeam11 = false;
  bool _hasBeenPressedTeam12 = false;
  bool _hasBeenPressedTeam13 = false;
  bool _hasBeenPressedTeam14 = false;
  bool _hasBeenPressedTeam15 = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: <Widget> [
              Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: Container(
                        child: InkWell(
                          onTap: (
                          () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SemiFinais()
                                )
                            );
                          }),
                          child: const Icon(
                            Icons.arrow_back, color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 50),
                  child: Text(style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'Montserrat',
                    color: Colors.red[400]
                  ),'Final'),
                ),
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
                                padding: const EdgeInsets.only(top: 10),
                                child: Material(
                                    borderRadius: BorderRadius.circular(90),
                                    child: CircleAvatar(backgroundImage: AssetImage('assets/images/brasil.png')),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text('Brasil'),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                height: 60,
                                width: 100,
                                color: Colors.transparent,
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _hasBeenPressedTeam1 ? Colors.lightGreenAccent : Colors.white,
                                  elevation: 5,
                                  shadowColor: Colors.black,
                                  child: InkWell(
                                    onTap: (() {
                                      setState(() {
                                        if(_hasBeenPressedTeam1 == false &&  _hasBeenPressedTeam2 == false) {
                                          _hasBeenPressedTeam1 =
                                          !_hasBeenPressedTeam1;

                                        } else{
                                          _hasBeenPressedTeam1 =
                                          !_hasBeenPressedTeam1;
                                          _hasBeenPressedTeam2 =
                                          !_hasBeenPressedTeam2;
                                        }
                                      });
                                    }
                                    ),
                                    child: const Center(
                                      child: Text(style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Montserrat'
                                      ),
                                          'VENCE'
                                      ),
                                    ),
                                  ),

                                ),
                              )
                            ],
                          ),

                          Text(style: TextStyle(
                            fontSize: 64, color: Colors.red[400],
                          ),'X'),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Material(
                                  borderRadius: BorderRadius.circular(90),
                                  child: CircleAvatar(backgroundImage: AssetImage('assets/images/franca.png'))
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: const Text('França'),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                height: 60,
                                width: 100,
                                color: Colors.transparent,
                                child: Material(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _hasBeenPressedTeam2 ? Colors.lightGreenAccent : Colors.white,
                                  elevation: 5,
                                  shadowColor: Colors.black,
                                  child: InkWell(
                                    onTap: (() {
                                      setState(() {
                                        if(_hasBeenPressedTeam1 == false &&  _hasBeenPressedTeam2 == false) {
                                          _hasBeenPressedTeam2 =
                                          !_hasBeenPressedTeam2;

                                        } else{
                                          _hasBeenPressedTeam1 = !_hasBeenPressedTeam1;
                                          _hasBeenPressedTeam2 = !_hasBeenPressedTeam2;
                                        }
                                      });
                                    }),
                                    child: const Center(
                                      child: Text(style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Montserrat'
                                      ),
                                          'VENCE'
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
                ),
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
                      color: Colors.teal,
                      child: InkWell(
                        child: Center(
                          child: Text(style: TextStyle(
                            color: Colors.white, fontFamily: 'Montserrat', fontSize: 32
                          ),
                            'Salvar'
                          ),
                        ),
                        onTap: (
                        () {

                        }
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