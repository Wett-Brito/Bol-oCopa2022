import 'package:flutter/material.dart';
import 'package:flutter_app/screens/GruposOuMataMata.dart';
import '../models/Team.dart';
import 'Group.dart';

class ChoiceGrupos extends StatelessWidget {
  static const String id = 'grupos_choice_screen';

  const ChoiceGrupos({Key? key, required this.teams}) : super(key: key);

  final List<Team> teams;

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
                                Navigator.pop(context);}),
                              child: const Icon(
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
                                      builder: (context) => Group(teams: [teams[0], teams[1], teams[2], teams[3]], grupo: 'A')
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Group(teams: [teams[5], teams[6], teams[7], teams[8]], grupo: 'B')
                                  )
                              );
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Group(teams: [teams[9], teams[10], teams[11], teams[12]], grupo: 'C')
                                  )
                              );
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Group(teams: [teams[13], teams[14], teams[15], teams[16]], grupo: 'D')
                                  )
                              );
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Group(teams: [teams[16], teams[17], teams[18], teams[19]], grupo: 'E')
                                  )
                              );
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Group(teams: [teams[20], teams[21], teams[22], teams[23]], grupo: 'F')
                                  )
                              );
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Group(teams: [teams[24], teams[25], teams[26], teams[27]], grupo: 'G')
                                  )
                              );
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Group(teams: [teams[28], teams[29], teams[30], teams[31]], grupo: 'H')
                                  )
                              );
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
