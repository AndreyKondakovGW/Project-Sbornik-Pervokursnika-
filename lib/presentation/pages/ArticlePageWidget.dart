import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../domain/modle/Article.dart';
import '../../data/repository/articlesrepo.dart';
import 'BasePage.dart';

var articlesarrwidget = newarticles.map((a) => ArticlePageWidget(a)).toList();

class ArticlePageWidget extends StatelessWidget {
  final Article article;
  ArticlePageWidget(this.article);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      titel: article.title,
      body: ListView(children: [
        Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 0),
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset(article.image1).image,
                    fit: BoxFit.fill,
                  ),
                  //borderRadius: BorderRadius.all(Radius.circular(30))
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    //borderRadius: BorderRadius.all(Radius.circular(25))
                    ),
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(50, 50, 51, 20).withOpacity(0.9),
                        //borderRadius: BorderRadius.all(
                        //  Radius.circular(25.0),
                        // ),
                      ),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      padding: EdgeInsets.all(15),
                      child: Text(article.text,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white)),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(top: 0, bottom: 15),
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset(article.image2).image,
                    fit: BoxFit.fill,
                  ),
                  //borderRadius: BorderRadius.all(Radius.circular(30))
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
