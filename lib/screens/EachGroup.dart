import 'package:flutter/material.dart';
import 'package:flutter_app/screens/GruposOuMataMata.dart';
import 'package:flutter_app/screens/personal_card_screen.dart';

import '../componentes/rounded_button.dart';
import 'ChoiceGrupos.dart';

class EachGroup extends StatefulWidget {
  const EachGroup({Key? key}) : super(key: key);

  @override
  State<EachGroup> createState() => _EachGroupState();
}

class _EachGroupState extends State<EachGroup> {
  // This variable holds the list's items
  final List<String> _todos = ['Vasco', 'Brasil', 'França', 'Argentina'];
  String nomeGrupo = "A";

  Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return Material(
          elevation: 0,
          color: Colors.transparent,
          child: child,
        );
      },
      child: child,
    );
  }

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
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 15, left: 15),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ChoiceGrupos()
                            )
                        );
                      },
                      child: Icon(
                        Icons.arrow_back, color: Colors.white,
                      ),
                    )
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 7),
                child: Container(
                  child: Text(style: TextStyle(fontSize: 35, fontFamily: "Montserrat"),"Grupo " + nomeGrupo),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
                child: ReorderableListView(
                  shrinkWrap: true,
                  proxyDecorator: proxyDecorator,
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 7, right: MediaQuery.of(context).size.width / 7),
                    children: _todos
                        .map((task) => Container(
                      color: Colors.transparent,
                      key: ValueKey(task),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Material(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                          child: ListTile(
                              contentPadding: const EdgeInsets.all(25),
                            // tileColor: Colors.transparent,
                            // contentPadding: const EdgeInsets.all(10),
                            // leading: const Icon(Icons.lock_clock),
                            title: Text(
                              task,
                              style: const TextStyle(fontSize: 24),
                            )
                          ),
                        ),
                      ),
                    ))
                        .toList(),
                    // The reorder function
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) {
                          newIndex -= 1;
                        }
                        final element = _todos.removeAt(oldIndex);
                        _todos.insert(newIndex, element);
                      });
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () {

                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    color: Colors.teal,

                      child: Center(
                        child: Text(
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'Montserrat', color: Colors.white), 'Salvar'),
                      )),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}