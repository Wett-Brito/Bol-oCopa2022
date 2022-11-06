import 'package:flutter/material.dart';

class InputPadrao extends StatelessWidget {
  const InputPadrao({
    Key? key,
    required this.nome,
    required this.paddingTop,

  }) : super(key: key);

  final String nome;
  final double paddingTop;

  static String valueComponent = '';

  String? get (){
    if(valueComponent != null){
      return valueComponent;
    } else{
      return '';
    }
  }
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
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
              onChanged: (value) {
                valueComponent = value;
              },
              decoration: InputDecoration(border: InputBorder.none, hintText: nome)),
        ),
      ),
    );
  }
}