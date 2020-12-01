import 'package:flutter/material.dart';
import 'package:sbornik_pervokursnika/lentawidgetsandrepo/postswidget.dart';
import 'package:sbornik_pervokursnika/pages/LentaPage.dart';
import 'package:sbornik_pervokursnika/pages/SbornikPage.dart';
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
      '/home': (BuildContext context) => LentaPage(),
      '/lenta': (BuildContext context) => LentaPage(),
      "/block/0": (BuildContext context) => articlesarrwidget[0],
      "/block/1": (BuildContext context) => articlesarrwidget[1],
      "/block/2": (BuildContext context) => articlesarrwidget[2],
      '/attestat': (BuildContext context) => NavPage(),
      '/study_plan': (BuildContext context) => NavPage(),
      '/prava_i_onbazonost': (BuildContext context) => NavPage(),
      '/academ_otpysk': (BuildContext context) => NavPage(),
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
