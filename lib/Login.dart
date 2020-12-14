import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:tccfinal/AppInterno/Page1.dart';
//import 'package:tccfinal/AppInterno/Page1.dart';
import 'package:tccfinal/Cadastro.dart';
import 'RecuperarSenha.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  get authUser => null;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String email, senha;

  /*Ajustar proporção na tela*/
  double displayHeight() => MediaQuery.of(context).size.height;
  double displayWidth() => MediaQuery.of(context).size.width;

  /*Mostrar senha obscura*/
  bool _showPassword = false;

  bool _validate = false;

  /* Validação do email */
  String _validarEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Informe seu e-mail";
    } else if (!regExp.hasMatch(value)) {
      return "E-mail inválido";
    }
    return null;
  }

/* Validação da senha */
  String _validarSenha(String value) {
    if (value.length < 6) {
      return "Senha inválida";
    } else if (value.isEmpty) {
      return "Informe a senha";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      /*App Bar*/
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          iconSize: 35,
          color: Colors.red[200],
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      /*Corpo*/
      body: Container(
        color: Colors.grey[850],
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: displayHeight() / 4,
                  right: displayWidth() / 20,
                  left: displayWidth() / 20,
                ),
                height: 55,
                /*Campo de texto - email*/
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 3),
                    ]),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: _validarEmail,
                  onSaved: (String value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    prefixIcon: Icon(Icons.person, color: Colors.cyan[100]),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  ),
                  style: TextStyle(fontSize: 17),
                ),
              ),
              SizedBox(height: 15),

              /*Campo de texto - senha*/
              Container(
                margin: EdgeInsets.only(
                  top: 3,
                  right: displayWidth() / 20,
                  left: displayWidth() / 20,
                ),
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 3),
                    ]),
                child: TextFormField(
                  controller: _passwordController,
                  validator: _validarSenha,
                  onSaved: (String value) {
                    senha = value;
                  },
                  style: TextStyle(fontSize: 17),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.only(left: 25, top: 3, bottom: 8),
                    labelText: "Senha",
                    prefixIcon: Icon(Icons.lock, color: Colors.cyan[100]),
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    suffixIcon: GestureDetector(
                      child: Icon(
                          _showPassword == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey),
                      onTap: () {
                        setState(() {
                          _showPassword = !_showPassword;
                        });
                      },
                    ),
                  ),
                  obscureText: _showPassword == false ? true : false,
                ),
              ),

              /*Botão recuperar senha*/
              Container(
                height: 50,
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecuperarSenha(),
                        ));
                  },
                  child: Text(
                    "Recuperar Senha",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 50,
                margin: EdgeInsets.symmetric(
                  horizontal: displayWidth() / 15,
                  vertical: 25,
                ),
                child: RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _sendForm();
                      _login();
                      /*_login();*/
                    }
                  },
                  color: Colors.red,
                  child: Text('Login', style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              SizedBox(height: 70),
              /*Text(
                'LOGIN COM SUAS REDES SOCIAIS',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              /*Logo do Google*/
              Container(
                height: 60,
                width: 30,
                child: IconButton(
                    icon: Image.asset('assets/google.png'), onPressed: () {}),
              ),*/
              Container(
                height: 60,
                alignment: Alignment.center,
                child: FlatButton(
                  child: Text("Novo por aqui? Crie sua conta",
                      style: TextStyle(color: Colors.red)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cadastro(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      /* validação do Formulário */
    );
  }

  void _sendForm() async {
    try {
      final User authUser = (await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text))
          .user;
      if (!authUser.emailVerified) {
        await authUser.sendEmailVerification();
        _emailController.clear();
        _passwordController.clear();
      }
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => Page1(
                    authUser: authUser,
                  )),
          (Route<dynamic> route) => false);
    } catch (e) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Falhar ao fazer login, tente novamente"),
      ));
      print(e);
    }
  }

  void _login() async {
    if (_auth.currentUser != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => Page1(
                    authUser: authUser,
                  )),
          (Route<dynamic> route) => false);
    }
  }
}
