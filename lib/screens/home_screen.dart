import 'package:asdl/screens/google_sign_in.dart';
import 'package:asdl/screens/login.dart';
import 'package:asdl/screens/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class homePage extends StatelessWidget {

//  homePage({@required this.onSignOut});
//  final VoidCallback onSignOut;

//  Future<void> _signOut() async {
//    try {
//      await FirebaseAuth.instance.signOut();
//      onSignOut();
//    } catch (e) {
//      print(e.toString());
//    }
//  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'MovieApp',
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black,
                size: 35,
              ),
              // onPressed: () {
              //   // do something
              // },
            ),
            IconButton(
              icon: Icon(
                Icons.local_grocery_store,
                color: Colors.black,
                size: 35,
              ),
//               onPressed: _signOut,
              onPressed: () {
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return loginScreen();}), ModalRoute.withName('/'));
              },
            ),
          ],
          backgroundColor: Colors.orange[400],
//        toolbarHeight: 90,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.orangeAccent, Colors.redAccent],
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      'Currently Playing',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(width: 152),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 25,
                    ),
                    // onPressed: () {
                    //   // do something
                    // },
                  ],
                ),
                width: 500,
                margin: EdgeInsets.symmetric(
                  vertical: 35,
                  horizontal: 15,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                height: 220,
                width: 450,
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.network(
                        'https://m.media-amazon.com/images/M/MV5BOGE2NmU0YmEtNzVmYy00YzcxLWExM2MtNDhmYjUwMzA3YjMzXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg',
                      ),
                    ),
                    SizedBox(width: 62),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.network(
                        'https://i.pinimg.com/736x/df/60/0a/df600a432c352e0034c49eb95fa27f8f.jpg',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      'Upcoming Movies',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(width: 140),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 25,
                    ),
                    // onPressed: () {
                    //   // do something
                    // },
                  ],
                ),
                width: 450,
                margin: EdgeInsets.symmetric(
                  vertical: 35,
                  horizontal: 15,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  //vertical: 35,
                  horizontal: 25,
                ),
                height: 220,
                width: 450,
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.network(
                        'https://in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/the-bad-nun-et00302252-09-12-2020-04-45-33.jpg',
                      ),
                    ),
                    SizedBox(width: 62),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.network(
                        'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2020%2F10%2F28%2Fwhite-tiger.jpg',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
              bottomNavigationBar: Container(
    height: 60,
    color: Colors.black12,
    child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => userdeets()),
          );
        },
    child: Padding(
    padding: EdgeInsets.only(top: 8.0),
    child: Column(
    children: <Widget>[
    Icon(
    Icons.supervised_user_circle,
    color: Theme.of(context).accentColor,
    ),
    Text('profile'),
    ],
    ),
    ),
    ),
//      bottomNavigationBar: BottomNavigationBar(
//        showSelectedLabels: false,
//        showUnselectedLabels: false,
//        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(
//              Icons.home,
//              color: Colors.black,
//              size: 40,
//            ),
////            label: 'Home',
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(
//              Icons.account_box,
//              color: Colors.black,
//              size: 40,
//            ),
////            label: 'Profile',
//          ),
//        ],
//        backgroundColor: Colors.redAccent,
//      ),

      ),
    ));
  }
}
