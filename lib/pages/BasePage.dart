import 'package:flutter/material.dart';

import 'Lenta/LentaPage.dart';
import 'Sbornik/SbornikPageMenu.dart';
import 'Profile/ProfilePage.dart';
import 'Faculties/FacultiesPage.dart';
import 'Favorites/FavoritesPage.dart';

//Базовый виджет с Навбаром
class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int currentIdex = 0;
  _NavPageState();

  final titels = [
    'Сборник первокурсника',
    'Избраное',
    'Лента',
    'Профиль',
    'Факультет',
  ];

  final routes = [
    '/home',
    '/favorites',
    '/lenta',
    '/profile',
    '/faculty',
  ];

  final children = [
    SbornikMenuPage(),
    FavoritesPage(),
    LentaPage(),
    ProfilePage(),
    FacultiesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(100, 149, 237, 30),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        title: Text(titels[currentIdex]),
      ),
      body: children[currentIdex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(25))),
        child: BottomNavigationBar(
          currentIndex: currentIdex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Сборник",
              backgroundColor: Color.fromRGBO(100, 149, 237, 30),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Избраное",
              backgroundColor: Color.fromRGBO(100, 149, 237, 30),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: "Лента",
              backgroundColor: Color.fromRGBO(100, 149, 237, 30),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.portrait),
              label: "Профиль",
              backgroundColor: Color.fromRGBO(100, 149, 237, 30),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Факультет",
              backgroundColor: Color.fromRGBO(100, 149, 237, 30),
            ),
          ],
          onTap: (index) {
            setState(() {
              currentIdex = index;
            });
          },
        ),
      ),
    );
  }
}
