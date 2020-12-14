import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal[200],
          title: Text(
            'Vestibulinho Etec',
            style: TextStyle(fontSize: 19),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp),
            iconSize: 35,
            color: Colors.red[200],
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: Container(
          child: GridView(
            padding: const EdgeInsets.all(10.0),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>[
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 16,
                  child: InkWell(
                      onTap: () {},
                      child: Ink.image(
                        height: 200,
                        image: AssetImage('assets/mat_logo.jpg'),
                        fit: BoxFit.fitWidth,
                        child: Text(
                          'Matemática',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ))),
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 16,
                  child: InkWell(
                      onTap: () {},
                      child: Ink.image(
                        height: 200,
                        image: AssetImage('assets/fisi_logo.png'),
                        fit: BoxFit.fitHeight,
                        child: Text(
                          'Física',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ))),
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 16,
                  child: InkWell(
                      onTap: () {},
                      child: Ink.image(
                        height: 200,
                        image: AssetImage('assets/geo_logo.jpg'),
                        fit: BoxFit.fitHeight,
                        child: Text(
                          'Geografia',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ))),
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 16,
                  child: InkWell(
                      onTap: () {},
                      child: Ink.image(
                        height: 200,
                        image: AssetImage('assets/port_logo.jpg'),
                        fit: BoxFit.fitHeight,
                        child: Text(
                          'Português',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ))),
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 16,
                  child: InkWell(
                      onTap: () {},
                      child: Ink.image(
                        height: 200,
                        image: AssetImage('assets/qui_logo.jpg'),
                        fit: BoxFit.fitHeight,
                        child: Text(
                          'Química',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ))),
              Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: 16,
                  child: InkWell(
                      onTap: () {},
                      child: Ink.image(
                        height: 80,
                        width: 80,
                        image: AssetImage('assets/his.jpg'),
                        fit: BoxFit.fitHeight,
                        child: Text(
                          'História',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ))),
            ],
          ),
        )
        /*Card(
            clipBehavior: Clip.antiAlias,
            elevation: 16,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () {},
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Ink.image(
                        height: 180,
                        width: 180,
                        image: AssetImage('assets/mat_logo.jpg'),
                        fit: BoxFit.fitWidth,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5, right: 5, left: 35, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Matemática',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.teal[300],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),*/
        );
  }
}
