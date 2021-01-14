import 'package:flutter/material.dart';
import './screens.dart';

class MovieName extends StatelessWidget {
  //final String questiontext;
  //Question(this.questiontext);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Movie List'),
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
                  color: Colors.yellow,
                ),
                title: Text(
                  'Movie 1',
                  textScaleFactor: 3,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                //trailing: Icon(Icons.done),
                //subtitle: Text('This is subtitle'),
                selected: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen(),
                    ),
                  );
                },
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
                  color: Colors.yellow,
                ),
                title: Text(
                  'Movie 2',
                  textScaleFactor: 3,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                //trailing: Icon(Icons.done),
                //subtitle: Text('This is subtitle'),
                selected: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen(),
                    ),
                  );
                },
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
                  color: Colors.yellow,
                ),
                title: Text(
                  'Movie 3',
                  textScaleFactor: 3,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                //trailing: Icon(Icons.done),
                //subtitle: Text('This is subtitle'),
                selected: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen(),
                    ),
                  );
                },
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
                  color: Colors.yellow,
                ),
                title: Text(
                  'Movie 4',
                  textScaleFactor: 3,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                //trailing: Icon(Icons.done),
                //subtitle: Text('This is subtitle'),
                selected: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen(),
                    ),
                  );
                },
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
                  color: Colors.yellow,
                ),
                title: Text(
                  'Movie 5',
                  textScaleFactor: 3,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                //trailing: Icon(Icons.done),
                //subtitle: Text('This is subtitle'),
                selected: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}