import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
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
            )),
        body: Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.only(top: 30),
            child: Stack(children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/user.png'),
              ),
            ])));
  }
}
