import 'package:attendence_app/crud/rounded_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RoundedButton(
                  colour: Colors.lightBlueAccent,
                  title: 'Log In',
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed('login screen');
                  },
                ),
                RoundedButton(
                    colour: Colors.blueAccent,
                    title: 'Register',
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed("registration screen");
                    }),
              ]),
        ));
  }
}


