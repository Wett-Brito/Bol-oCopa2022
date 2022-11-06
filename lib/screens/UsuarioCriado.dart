import 'package:flutter/material.dart';
import 'Inscricao.dart';

class UsuarioCriado extends StatelessWidget {
  static const String id = 'grupos_choice_screen';

  const UsuarioCriado({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement<void, void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const Inscricao(),
                      ),
                    );
                  },
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
              child: Center(
                child: Text(style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'PoppinsRegular',
                  fontWeight: FontWeight.bold,
                  color: Colors.red[400],
                ),
                    'Usuario Criado com sucesso'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
              child: Image.asset('assets/images/Front.png'),
            )
          ],
        ),
      ),
    );
  }
}
