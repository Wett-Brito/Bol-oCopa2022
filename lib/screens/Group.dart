import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../models/Team.dart';


class Group extends StatelessWidget {
  const Group({Key? key, required this.teams, required this.grupo}) : super(key: key);

  final List<Team> teams;
  final String grupo;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
          children: [
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 15, left: 15),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back, color: Colors.white,
                            ),
                          )
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(style: TextStyle(
                      color: Colors.red[400],
                      fontFamily: 'PoppinsBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 32
                    ),
                      'Grupo $grupo'
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20, left: MediaQuery.of(context).size.width / 20, top: 15),
                          child: Center(
                            child: Material(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              elevation: 5,
                              child: ListTile(
                                leading: Image.network( teams[0].flag , width: 40),
                                title: Text(teams[0].name_en),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20, left: MediaQuery.of(context).size.width / 20, top: 15),
                          child: Center(
                            child: Material(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              elevation: 5,
                              child: ListTile(
                                leading: Image.network(teams[1].flag , width: 40),
                                title: Text(teams[1].name_en),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20, left: MediaQuery.of(context).size.width / 20, top: 15),
                          child: Center(
                            child: Material(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              elevation: 5,
                              child: ListTile(
                                leading: Image.network(teams[2].flag , width: 40),
                                title: Text(teams[2].name_en),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 20, left: MediaQuery.of(context).size.width / 20, top: 15),
                          child: Center(
                            child: Material(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              elevation: 5,
                              child: ListTile(
                                leading: Image.network(teams[3].flag , width: 40),
                                title: Text(teams[3].name_en),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
    );
  }
}