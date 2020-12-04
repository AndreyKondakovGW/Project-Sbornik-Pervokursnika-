import 'repository/postrepo.dart';
import 'postswidget.dart';

import 'package:flutter/material.dart';

class LentaPage extends StatelessWidget {
  final containers = posts.map((post) => PostWidget(post)).toList();

  @override
  Widget build(BuildContext context) {
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
