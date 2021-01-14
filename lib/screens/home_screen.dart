import 'package:asdl/screens/google_sign_in.dart';
import 'package:asdl/screens/login.dart';
import 'package:asdl/screens/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {

  static final String id = 'home_screen';

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  final dbRef = FirebaseDatabase.instance.reference().child("movies");
  List<Map<dynamic, dynamic>> lists = [];
  final dbRefupcoming =
  FirebaseDatabase.instance.reference().child("upcomingmovies");
  List<Map<dynamic, dynamic>> listsupcoming = [];

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
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:18.0,left: 28),
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
                ),
                FutureBuilder(
                    future: dbRef.once(),
                    builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        lists.clear();
                        Map<dynamic, dynamic> values = snapshot.data.value;
                        values.forEach((key, values) {
                          lists.add(values);
                        });
                        return Expanded(
                          child: new ListView.builder
                            (
                            scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: lists.length,
                              itemBuilder: (BuildContext context, int index){
                                return Padding(
                                  padding: const EdgeInsets.only(left:18.0,top: 8,bottom: 8,),
                                  child: GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                            elevation: 16,
                                            title: Text(lists[index]['name']),
                                            content: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(15.0),
                                                  child: Image.network(
                                                    lists[index]["url"],
                                                    fit: BoxFit.fill,
//                                                    height: 100,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text("Language : " + lists[index]['type']),
                                                SizedBox(height: 10),
                                                FlatButton(
                                                  color: Colors.blueAccent,
                                                  onPressed: null,
                                                  child: Text('BUY NOW', style: TextStyle(
                                                      color: Colors.blue
                                                  )
                                                  ),
                                                  textColor: Colors.white,
                                                  shape: RoundedRectangleBorder(side: BorderSide(
                                                      color: Colors.blue,
                                                      width: 1,
                                                      style: BorderStyle.solid
                                                  ), borderRadius: BorderRadius.circular(50)),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        lists[index]["url"],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  // ignore: missing_return
                                );
                          }),
                        );
                      }
                      return CircularProgressIndicator();
                    }),
                Padding(
                  padding: const EdgeInsets.only(top:18.0,left: 28),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Upcoming',
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
                ),
                FutureBuilder(
                    future: dbRefupcoming.once(),
                    builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
                      if (snapshot.hasData) {
                        listsupcoming.clear();
                        Map<dynamic, dynamic> values = snapshot.data.value;
                        values.forEach((key, values) {
                          listsupcoming.add(values);
                        });
                        return Expanded(
                          child: new ListView.builder
                            (
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: listsupcoming.length,
                              itemBuilder: (BuildContext context, int index){
                                return Padding(
                                  padding: const EdgeInsets.only(left:18.0,top: 8,bottom: 8,),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                listsupcoming[index]["url"],
                                fit: BoxFit.fill,
                                ),
                                ),
                                );
                              }),
                        );
                      }
                      return CircularProgressIndicator();
                    }),
              ],
            ),
          ),
//        body: Container(
//          decoration: BoxDecoration(
//            gradient: LinearGradient(
//              begin: Alignment.topCenter,
//              end: Alignment.bottomCenter,
//              colors: [Colors.orangeAccent, Colors.redAccent],
//            ),
//          ),
//          child: Column(
//            children: <Widget>[
//              Container(
//                child: Row(
//                  children: <Widget>[
//                    Text(
//                      'Currently Playing',
//                      style: TextStyle(
//                        color: Colors.black,
//                        fontSize: 24,
//                        fontWeight: FontWeight.w800,
//                      ),
//                    ),
//                    SizedBox(width: 152),
//                    Icon(
//                      Icons.arrow_forward_ios,
//                      color: Colors.black,
//                      size: 25,
//                    ),
//                    // onPressed: () {
//                    //   // do something
//                    // },
//                  ],
//                ),
//                width: 500,
//                margin: EdgeInsets.symmetric(
//                  vertical: 35,
//                  horizontal: 15,
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.symmetric(
//                  horizontal: 25,
//                ),
//                height: 220,
//                width: 450,
//                child: Row(
//                  children: <Widget>[
//                    ClipRRect(
//                      borderRadius: BorderRadius.circular(25.0),
//                      child: Image.network(
//                        'https://m.media-amazon.com/images/M/MV5BOGE2NmU0YmEtNzVmYy00YzcxLWExM2MtNDhmYjUwMzA3YjMzXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg',
//                      ),
//                    ),
//                    SizedBox(width: 62),
//                    ClipRRect(
//                      borderRadius: BorderRadius.circular(25.0),
//                      child: Image.network(
//                        'https://i.pinimg.com/736x/df/60/0a/df600a432c352e0034c49eb95fa27f8f.jpg',
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//              Container(
//                child: Row(
//                  children: <Widget>[
//                    Text(
//                      'Upcoming Movies',
//                      style: TextStyle(
//                        color: Colors.black,
//                        fontSize: 24,
//                        fontWeight: FontWeight.w800,
//                      ),
//                    ),
//                    SizedBox(width: 140),
//                    Icon(
//                      Icons.arrow_forward_ios,
//                      color: Colors.black,
//                      size: 25,
//                    ),
//                    // onPressed: () {
//                    //   // do something
//                    // },
//                  ],
//                ),
//                width: 450,
//                margin: EdgeInsets.symmetric(
//                  vertical: 35,
//                  horizontal: 15,
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.symmetric(
//                  //vertical: 35,
//                  horizontal: 25,
//                ),
//                height: 220,
//                width: 450,
//                child: Row(
//                  children: <Widget>[
//                    ClipRRect(
//                      borderRadius: BorderRadius.circular(25.0),
//                      child: Image.network(
//                        'https://in.bmscdn.com/iedb/movies/images/mobile/thumbnail/xlarge/the-bad-nun-et00302252-09-12-2020-04-45-33.jpg',
//                      ),
//                    ),
//                    SizedBox(width: 62),
//                    ClipRRect(
//                      borderRadius: BorderRadius.circular(25.0),
//                      child: Image.network(
//                        'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F6%2F2020%2F10%2F28%2Fwhite-tiger.jpg',
//                      ),
//                    ),
//                  ],
//                ),
//              )
//            ],
//          ),
//        ),
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
//  Widget _buildAboutDialog(BuildContext context) {
//    return new AlertDialog(
//      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//      elevation: 16,
//      title: lists[widget.index]["name"],
//        content: Text("data"),
//    );
//  }
}

