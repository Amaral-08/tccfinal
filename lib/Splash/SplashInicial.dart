import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tccfinal/Cadastro.dart';
import 'package:tccfinal/InitScreen.dart';
import 'package:tccfinal/Login.dart';
import 'package:tccfinal/Splash/Loader.dart';

class SplashInicial extends StatefulWidget {
  final user;

  const SplashInicial({Key key, this.user}) : super(key: key);
  @override
  _SplashInicialState createState() => _SplashInicialState();
}

class _SplashInicialState extends State<SplashInicial> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final pageController = PageController(initialPage: 1);
  final user1 = _auth.currentUser;
  return Scaffold(
    body: Container(
      child: AnimatedSplashScreen(
        duration: 5,
        splash: ColorLoader2(),
        nextScreen: PageView(controller: pageController, children: <Widget>[
          Scaffold(body: Cadastro()),
          Scaffold(body: InitScreen(pageController, user1)),
          Scaffold(body: LoginPage()),
        ]),
      ),
    ),
  );
}
