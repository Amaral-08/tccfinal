import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:tccfinal/Auth/Authentication.dart';
import 'package:tccfinal/InitScreen.dart';
import 'package:tccfinal/Login.dart';
//import 'package:tccfinal/Splash/SplashInicial.dart';

class Cadastro extends StatefulWidget {
  @override
  CadastroState createState() => CadastroState();
}

class CadastroState extends State<Cadastro> {
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  /*Ajustar proporção na tela*/
  double displayHeight() => MediaQuery.of(context).size.height;
  double displayWidth() => MediaQuery.of(context).size.width;

  /*Mostrar senha obscura*/
  bool _showPassword = false;

  bool _validate = false;

  String nome, email, senha;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  /*final AuthenticationServices _auth = AuthenticationServices();*/
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /* Validação do nome */
  String _validarNome(String value) {
    String pattern = r'([a-zA-Z]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.isEmpty) {
      return "Informe seu nome";
    }
    if (value.length < 4) {
      return "Informe o nome completo";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter apenas caracteres de a-z ou A-Z";
    }
    return null;
  }

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
      return "A senha deve conter ao menos 6 caracteres";
    } else if (value.isEmpty) {
      return "Informe a senha";
    }
    return null;
  }

  /* validação do Formulário */
  _sendForm() {
    if (_formKey.currentState.validate()) {
      //Sem erros na validação
      _formKey.currentState.save();
      print("Nome: $nome");
      print("Email: $email");
      print("senha: $senha");
    } else {
      setState(() {
        _validate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*App Bar */
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
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 3),
                  ],
                ),
                /* Campo de texto Nome*/
                child: TextFormField(
                  controller: _nomeController,
                  validator: _validarNome,
                  onSaved: (String value) {
                    nome = value;
                  },
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 17),
                  decoration: InputDecoration(
                    labelText: "Nome Completo",
                    labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    prefixIcon: Icon(Icons.person, color: Colors.cyan[100]),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 4,
                  right: displayWidth() / 20,
                  left: displayWidth() / 20,
                ),
                height: 50,
                /* Campo de texto Email*/

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 3),
                  ],
                ),
                child: TextFormField(
                  controller: _emailController,
                  cursorColor: Colors.black38,
                  style: TextStyle(fontSize: 17),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    prefixIcon: Icon(Icons.email, color: Colors.cyan[100]),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  ),
                  validator: _validarEmail,
                  onSaved: (String value) {
                    email = value;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 3,
                  right: displayWidth() / 20,
                  left: displayWidth() / 20,
                ),
                height: 50,
                /* Campo de texto Senha*/
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
                        EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    prefixIcon: Icon(Icons.lock, color: Colors.cyan[100]),
                    border: InputBorder.none,
                    labelText: "Senha",
                    labelStyle: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    suffixIcon: GestureDetector(
                      /*obscurecer senha ou mostrar*/
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

              /*Botão Cadastrar*/
              Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(
                    horizontal: displayWidth() / 20,
                    vertical: 25,
                  ),
                  child: RaisedButton(
                    onPressed: () async {
                      _sendForm();
                      _registerAcount();
                    },
                    color: Colors.red,
                    child: Text('Cadastre-se',
                        style: TextStyle(color: Colors.white)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                  )),
              SizedBox(height: 135),
              Container(
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                      child: Text("Já tem Cadastro? Faça login",
                          style: TextStyle(color: Colors.red)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }

  _registerAcount() async {
    final User authUser = (await _auth.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
        .user;

    if (authUser != null) {
      if (!authUser.emailVerified) {
        await authUser.sendEmailVerification();
        _nomeController.clear();
        _emailController.clear();
        _passwordController.clear();
      }

      await authUser.updateProfile(displayName: _nomeController.text);
      final auth = _auth.currentUser;
      final pageController = PageController(initialPage: 1);

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        /*return LoginPage(user: user1);*/
        return InitScreen(pageController, authUser);
      }));
    }
  }
}

/*createUser() async {
    dynamic result = await _auth.createNewUser(
        _emailController.text, _passwordController.text);
    if (result == null) {
      print('Email inválido');
    } else {
      print('DEU CERTOOOOO');
      _nomeController.clear();
      _emailController.clear();
      _passwordController.clear();
    }
  }*/
