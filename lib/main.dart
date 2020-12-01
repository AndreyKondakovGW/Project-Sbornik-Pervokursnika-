import 'package:flutter/material.dart';
import 'package:sbornik_pervokursnika/lentawidgetsandrepo/postswidget.dart';
import 'package:sbornik_pervokursnika/pages/LentaPage.dart';
import 'package:sbornik_pervokursnika/pages/PostsViewPage.dart';
import 'package:sbornik_pervokursnika/pages/SbornikPageMenu.dart';
import 'pages/LoginRegistrationpage.dart';
import 'pages/BasePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/login', routes: {
      '/login': (BuildContext context) => LoginRegestrationPage(),
      '/home': (BuildContext context) => NavPage(),
      '/lenta': (BuildContext context) => LentaPage(),
      "/block/0": (BuildContext context) => SbornikPage(),
      "/block/1": (BuildContext context) => articlesarrwidget[0],
      "/block/2": (BuildContext context) => articlesarrwidget[1],
      '/attestat': (BuildContext context) => articlesarrwidget[2],
      '/study_plan': (BuildContext context) => articlesarrwidget[3],
      '/prava_i_onbazonost': (BuildContext context) => articlesarrwidget[4],
      '/academ_otpysk': (BuildContext context) => articlesarrwidget[5],
    });
  }
}

// Sbornik
//       },
//       title: 'Сборник первокурсника',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//     );
//   }
// }
