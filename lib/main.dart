import 'package:flutter/material.dart';
import 'presentation/pages/LoginRegistrationpage.dart';
import 'presentation/pages/BasePage.dart';
import 'presentation/pages/ArticlePageWidget.dart';
import 'presentation/pages/PostsViewPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login', 
      routes: {
        '/login': (BuildContext context) => LoginRegestrationPage(),
        '/home': (BuildContext context) => NavPage(),


        '/block/0': (BuildContext context) => ArticleListWidget(),
        '/block/1': (BuildContext context) => articlesarrwidget[0],
        '/block/2': (BuildContext context) => articlesarrwidget[1],
        '/block/3': (BuildContext context) => articlesarrwidget[1],
        '/block/4': (BuildContext context) => articlesarrwidget[0],
        '/block/5': (BuildContext context) => articlesarrwidget[0],
        '/block/6': (BuildContext context) => articlesarrwidget[0],
        '/block/7': (BuildContext context) => articlesarrwidget[0],
        '/block/8': (BuildContext context) => articlesarrwidget[0],
        '/block/9': (BuildContext context) => articlesarrwidget[0],


        '/attestat': (BuildContext context) => articlesarrwidget[2],
        '/study_plan': (BuildContext context) => articlesarrwidget[3],
        '/prava_i_onbazonost': (BuildContext context) => articlesarrwidget[4],
        '/academ_otpysk': (BuildContext context) => articlesarrwidget[5],
    });
  }
}

