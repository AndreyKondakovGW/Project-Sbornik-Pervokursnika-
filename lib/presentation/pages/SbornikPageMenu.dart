import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../data/repository/blockrepo.dart';
import '../Sbornikblockswidget.dart';

class SbornikMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) =>
            BlockWidget(blocks[index], index),
        staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 6.0,
      ),
    );
  }
}
