import 'package:flutter/material.dart';
import 'pages/LoginRegistrationpage.dart';
import 'pages/BasePage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/login':(BuildContext context) => LoginRegestrationPage(),
        '/attestat':(BuildContext context) => NavPage(),
        '/study_plan':(BuildContext context) => NavPage(),
        '/prava_i_onbazonost':(BuildContext context) => NavPage(),
        '/academ_otpysk':(BuildContext context) => NavPage(),

        '/home':(BuildContext context) => NavPage(),
      },
      title: 'Сборник первокурсника',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
