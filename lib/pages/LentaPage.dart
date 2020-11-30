import 'package:sbornik_pervokursnika/postrepo.dart';
import 'package:sbornik_pervokursnika/postswidget.dart';

import 'package:flutter/material.dart';

class LentaPage extends StatelessWidget
{
  final containers = posts.map((post) => PostWidget(post)).toList();

  @override
  Widget build(BuildContext context){
    return Center(
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
    );
  }
}