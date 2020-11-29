import 'package:flutter/material.dart';
// import 'package:Pro/post.dart';
// import 'package:posts_feed/postswidget.dart';
// import 'package:posts_feed/postrepo.dart';

import 'postrepo.dart';
import 'postswidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Лента';

    return MaterialApp(
      title: title,
      home: Scaffold(
        //backgroundColor: ,

        appBar: AppBar(
          title: Text('ЛЕНТА'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, size: 30),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            )
          ],
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     colors: [
              //       Color.fromRGBO(89, 31, 129, 10),
              //       //Color.fromRGBO(0, 0, 0, 10),
              //       Color.fromRGBO(0, 0, 0, 10),
              //     ]),
              color: Colors.black,
            ),
            child: ListView(
              children: [
                Column(
                  //crossAxisCount: 1,
                  children: containers,
                  mainAxisSize: MainAxisSize.min,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  var containers = posts.map((post) => PostWidget(post)).toList();
}
