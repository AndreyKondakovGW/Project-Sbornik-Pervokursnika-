import 'package:sbornik_pervokursnika/lentawidgetsandrepo/postrepo.dart';
import 'package:sbornik_pervokursnika/lentawidgetsandrepo/postswidget.dart';

import 'package:flutter/material.dart';

class LentaPage extends StatelessWidget {
  final containers = posts.map((post) => PostWidget(post)).toList();

  @override
  Widget build(BuildContext context) {
    //final title = 'Лента';
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: ListView(
          children: [
            Column(
              children: containers,
              mainAxisSize: MainAxisSize.min,
            ),
          ],
        ),
      ),
    );
  }
}
