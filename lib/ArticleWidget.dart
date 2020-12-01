import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'block.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;
  ArticleWidget(this.article);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            title: Text(article.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ))),
        body: ListView(children: [
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset(article.image1).image,
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: Text(article.text,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white)),
                      )),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset(article.image2).image,
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
              ],
            ),
          ),
        ]));
  }
}

