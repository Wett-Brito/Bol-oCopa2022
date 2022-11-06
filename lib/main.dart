import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/Inscricao.dart';


import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.yellow,
    //   ),
    //   initialRoute: GruposChoiceScreen.id,
    //   routes: {
    //     QuizScreen.id: (context) => const QuizScreen(),
    //     FinishedQuizScreen.id: (context) => FinishedQuizScreen(
    //       arguments: ModalRoute.of(context)?.settings.arguments as FinishedQuizScreenArguments)
    //
    //   },
    // );

    return MaterialApp(
      title: 'Consulta Copa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Inscricao(),
    );
  }
}


