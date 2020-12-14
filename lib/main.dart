import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:tccfinal/AppInterno/Page1.dart';
import 'package:tccfinal/InitScreen.dart';
import 'package:tccfinal/Login.dart';
import 'package:tccfinal/Cadastro.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tccfinal/Splash/SplashInicial.dart';
/*import 'package:tccfinal/Splash/SplashInicial.dart';*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  get user1 => _auth.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageView(controller: pageController, children: <Widget>[
        Scaffold(body: Cadastro()),
        Scaffold(body: InitScreen(pageController, user1)),
        Scaffold(body: LoginPage()),
      ]),
      /*PageView(controller: pageController, children: <Widget>[
        Scaffold(body: Cadastro()),
        Scaffold(body: InitScreen(pageController)),
        Scaffold(body: LoginPage()),*/
      /* ]),
    );*/
    );
  }
}
