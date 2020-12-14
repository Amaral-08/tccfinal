import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan[200],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp),
            iconSize: 35,
            color: Colors.red[200],
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: Container(
            padding: EdgeInsets.only(
              top: 40,
              left: 40,
              right: 40,
            ),
            child: ListView(
              children: <Widget>[
                Text(
                  "Quem somos?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.redAccent),
                ),
                SizedBox(height: 10),
                SizedBox(
                    width: 340,
                    height: 340,
                    child: Image.asset('assets/nos1.jpg')),
                SizedBox(height: 20),
                Text(
                  'Alunos do 3º informática da instituição Centro Paula Souza, escola Prof.ª Anna de Oliveira Ferraz.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Juntos, desenvolvemos nosso aplicativo para o Trabalho de Conclusão de Curso.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  ',Atenciosamente',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  ' Equipe eStudex -',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                )
              ],
            )));
  }
}
