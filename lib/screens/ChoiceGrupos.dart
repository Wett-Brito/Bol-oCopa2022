import 'package:flutter/material.dart';
import 'package:flutter_app/screens/GruposOuMataMata.dart';
import 'package:flutter_app/screens/personal_card_screen.dart';

import '../componentes/rounded_button.dart';
import 'EachGroup.dart';

class ChoiceGrupos extends StatelessWidget {
  static const String id = 'grupos_choice_screen';

  const ChoiceGrupos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.red[400],
                )
              ],
            ),
            SafeArea(
              child: ListView(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              onTap: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                    builder: (context) => const GruposOuMataMata()
                                )
                                );}),
                              child: Icon(
                                Icons.arrow_back, color: Colors.white,
                              )
                          )
                          
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Center(
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                        color: Colors.white,
                        elevation: 5,
                        shadowColor: Colors.black,
                        child: Ink(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 100,
                          color: Colors.transparent,

                          child: InkWell(

                            borderRadius: BorderRadius.all(Radius.elliptical(40, 40)),
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const EachGroup()
                                  )
                              );
                              },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(),
                                      Text(style: TextStyle(fontFamily: 'Montserrat', fontSize: 32), 'Grupo A'),

                                      Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Material(
                                          borderRadius: BorderRadius.all(Radius.circular(180)),
                                          color: Colors.white,
                                          elevation: 5,
                                          shadowColor: Colors.black,
                                              child: InkWell(
                                                  borderRadius: BorderRadius.all(Radius.circular(180)),
                                                  child: Icon(
                                                      Icons.arrow_forward,
                                                      size: 50,
                                                      color: Colors.red[400],
                                                  )
                                              ),
                                            ),
                                          ),

                                    ],
                                  ),
                                  // child: ,


                            ),

                          ),
                        ),

                ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                        color: Colors.white,
                        elevation: 5,
                        shadowColor: Colors.black,
                        child: Ink(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 100,
                          color: Colors.transparent,

                          child: InkWell(

                            borderRadius: BorderRadius.all(Radius.elliptical(40, 40)),
                            onTap: (){
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                Text(style: TextStyle(fontFamily: 'Montserrat', fontSize: 32), 'Grupo B'),

                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Material(
                                    borderRadius: BorderRadius.all(Radius.circular(180)),
                                    color: Colors.white,
                                    elevation: 5,
                                    shadowColor: Colors.black,
                                    child: InkWell(
                                        borderRadius: BorderRadius.all(Radius.circular(180)),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 50,
                                          color: Colors.red[400],
                                        )
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            // child: ,


                          ),

                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                        color: Colors.white,
                        elevation: 5,
                        shadowColor: Colors.black,
                        child: Ink(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 100,
                          color: Colors.transparent,

                          child: InkWell(

                            borderRadius: BorderRadius.all(Radius.elliptical(40, 40)),
                            onTap: (){
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                Text(style: TextStyle(fontFamily: 'Montserrat', fontSize: 32), 'Grupo C'),

                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Material(
                                    borderRadius: BorderRadius.all(Radius.circular(180)),
                                    color: Colors.white,
                                    elevation: 5,
                                    shadowColor: Colors.black,
                                    child: InkWell(
                                        borderRadius: BorderRadius.all(Radius.circular(180)),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 50,
                                          color: Colors.red[400],
                                        )
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            // child: ,


                          ),

                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                        color: Colors.white,
                        elevation: 5,
                        shadowColor: Colors.black,
                        child: Ink(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 100,
                          color: Colors.transparent,

                          child: InkWell(

                            borderRadius: BorderRadius.all(Radius.elliptical(40, 40)),
                            onTap: (){
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                Text(style: TextStyle(fontFamily: 'Montserrat', fontSize: 32), 'Grupo D'),

                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Material(
                                    borderRadius: BorderRadius.all(Radius.circular(180)),
                                    color: Colors.white,
                                    elevation: 5,
                                    shadowColor: Colors.black,
                                    child: InkWell(
                                        borderRadius: BorderRadius.all(Radius.circular(180)),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 50,
                                          color: Colors.red[400],
                                        )
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            // child: ,


                          ),

                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                        color: Colors.white,
                        elevation: 5,
                        shadowColor: Colors.black,
                        child: Ink(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 100,
                          color: Colors.transparent,

                          child: InkWell(

                            borderRadius: BorderRadius.all(Radius.elliptical(40, 40)),
                            onTap: (){
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                Text(style: TextStyle(fontFamily: 'Montserrat', fontSize: 32), 'Grupo E'),

                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Material(
                                    borderRadius: BorderRadius.all(Radius.circular(180)),
                                    color: Colors.white,
                                    elevation: 5,
                                    shadowColor: Colors.black,
                                    child: InkWell(
                                        borderRadius: BorderRadius.all(Radius.circular(180)),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 50,
                                          color: Colors.red[400],
                                        )
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            // child: ,


                          ),

                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                        color: Colors.white,
                        elevation: 5,
                        shadowColor: Colors.black,
                        child: Ink(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 100,
                          color: Colors.transparent,

                          child: InkWell(

                            borderRadius: BorderRadius.all(Radius.elliptical(40, 40)),
                            onTap: (){
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                Text(style: TextStyle(fontFamily: 'Montserrat', fontSize: 32), 'Grupo F'),

                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Material(
                                    borderRadius: BorderRadius.all(Radius.circular(180)),
                                    color: Colors.white,
                                    elevation: 5,
                                    shadowColor: Colors.black,
                                    child: InkWell(
                                        borderRadius: BorderRadius.all(Radius.circular(180)),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 50,
                                          color: Colors.red[400],
                                        )
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            // child: ,


                          ),

                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                        color: Colors.white,
                        elevation: 5,
                        shadowColor: Colors.black,
                        child: Ink(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 100,
                          color: Colors.transparent,

                          child: InkWell(

                            borderRadius: BorderRadius.all(Radius.elliptical(40, 40)),
                            onTap: (){
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                Text(style: TextStyle(fontFamily: 'Montserrat', fontSize: 32), 'Grupo G'),

                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Material(
                                    borderRadius: BorderRadius.all(Radius.circular(180)),
                                    color: Colors.white,
                                    elevation: 5,
                                    shadowColor: Colors.black,
                                    child: InkWell(
                                        borderRadius: BorderRadius.all(Radius.circular(180)),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 50,
                                          color: Colors.red[400],
                                        )
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            // child: ,


                          ),

                        ),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 50),
                    child: Center(
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
                        color: Colors.white,
                        elevation: 5,
                        shadowColor: Colors.black,
                        child: Ink(
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: 100,
                          color: Colors.transparent,

                          child: InkWell(

                            borderRadius: BorderRadius.all(Radius.elliptical(40, 40)),
                            onTap: (){
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                Text(style: TextStyle(fontFamily: 'Montserrat', fontSize: 32), 'Grupo H'),

                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Material(
                                    borderRadius: BorderRadius.all(Radius.circular(180)),
                                    color: Colors.white,
                                    elevation: 5,
                                    shadowColor: Colors.black,
                                    child: InkWell(
                                        borderRadius: BorderRadius.all(Radius.circular(180)),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          size: 50,
                                          color: Colors.red[400],
                                        )
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            // child: ,


                          ),

                        ),
                      ),

                    ),
                  ),

                ],
              ),
            )

      ],

      ),
    );
  }
}
