import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sbornik_pervokursnika/WidgetsArticles/ArticleWidget.dart';
import 'package:sbornik_pervokursnika/WidgetsArticles/articlesrepo.dart';
import 'package:sbornik_pervokursnika/lentawidgetsandrepo/blockrepo.dart';
import 'package:sbornik_pervokursnika/lentawidgetsandrepo/blockswidget.dart';

class SbornikMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('СБОРНИК ПЕРВОКУРСНИКА'),
        actions: <Widget>[],
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 50),
          child: StaggeredGridView.countBuilder(
            crossAxisCount: 3,
            itemCount: 9,
            itemBuilder: (BuildContext context, int index) =>
                BlockWidget(blocks[index], index),
            staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
            mainAxisSpacing: 40.0,
            crossAxisSpacing: 6.0,
          ),
        ),
      ),
    );
  }
}

var articlesarrwidget =
    newarticles.map((article) => ArticleWidget(article)).toList();
