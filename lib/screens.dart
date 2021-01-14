import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  //final String questiontext;
  //Question(this.questiontext);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Nearby Screens'),
          backgroundColor: Colors.lightGreen,
//          toolbarHeight: 70,
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.purple,
              constraints: BoxConstraints(
                minHeight: 70,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.movie_creation,
                  size: 60,
                  color: Colors.deepOrange,
                ),
                title: Text(
                  'Screen 1',
                  textScaleFactor: 3,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                //trailing: Icon(Icons.done),
                //subtitle: Text('This is subtitle'),
                selected: true,
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Screen(),
              ),
            ),
            Container(
              color: Colors.purple,
              constraints: BoxConstraints(
                minHeight: 70,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.movie_creation,
                  size: 60,
                  color: Colors.deepOrange,
                ),
                title: Text(
                  'Screen 2',
                  textScaleFactor: 3,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                //trailing: Icon(Icons.done),
                //subtitle: Text('This is subtitle'),
                selected: true,
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Screen(),
              ),
            ),
            Container(
              color: Colors.purple,
              constraints: BoxConstraints(
                minHeight: 70,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.movie_creation,
                  size: 60,
                  color: Colors.deepOrange,
                ),
                title: Text(
                  'Screen 3',
                  textScaleFactor: 3,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                //trailing: Icon(Icons.done),
                //subtitle: Text('This is subtitle'),
                selected: true,
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Screen(),
              ),
            ),
            Container(
              color: Colors.purple,
              constraints: BoxConstraints(
                minHeight: 70,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.movie_creation,
                  size: 60,
                  color: Colors.deepOrange,
                ),
                title: Text(
                  'Screen 4',
                  textScaleFactor: 3,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                //trailing: Icon(Icons.done),
                //subtitle: Text('This is subtitle'),
                selected: true,
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Screen(),
              ),
            ),
            Container(
              color: Colors.purple,
              constraints: BoxConstraints(
                minHeight: 70,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.movie_creation,
                  size: 60,
                  color: Colors.deepOrange,
                ),
                title: Text(
                  'Screen 5',
                  textScaleFactor: 3,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                //trailing: Icon(Icons.done),
                //subtitle: Text('This is subtitle'),
                selected: true,
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Screen(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}