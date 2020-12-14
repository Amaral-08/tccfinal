import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get authStateChanges => _auth.authStateChanges();

  //cadastro email e senha
  Future createNewUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return "Cadastro realizado";
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  //login email e senha
  Future signIn(String email, String passoword) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: passoword);
      return "Login";
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }
  //sign out
}
