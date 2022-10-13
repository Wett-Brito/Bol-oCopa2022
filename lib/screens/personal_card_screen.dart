import 'package:flutter/material.dart';

class PersonalCardScreen extends StatefulWidget {

  static const String id = 'personal_card_screen';

  const PersonalCardScreen({Key? key}) : super(key: key);

  @override
  State<PersonalCardScreen> createState() => _PersonalCardScreenState();
}

class _PersonalCardScreenState extends State<PersonalCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://miro.medium.com/max/1400/0*vowtRZE_wvyVA7CB'),
                radius: 70),
            SizedBox(height: 16),
            const Text(
              'Tami Sakita',
              style: TextStyle(
                fontFamily: 'Nabla',
                color: Colors.pink,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
                elevation: 8,
                child: ListTile(
                  leading: Icon(
                    Icons.phone_android,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '11 9999-5555',
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                color: Colors.white,
                elevation: 8,
                child: ListTile(
                  leading: Icon(
                    Icons.email_outlined,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'email@gmail.com',
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}