import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
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
        child: SnakeNavigationBar.color(

          snakeViewColor: Color.fromRGBO(100, 149, 237, 30),
          selectedItemColor: Colors.white,
          snakeShape: SnakeShape.circle,
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          backgroundColor: Color.fromRGBO(100, 149, 237, 30),
          currentIndex: currentIdex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: "Сборник",
              backgroundColor: Color.fromRGBO(100, 149, 237, 30),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Избраное",
              backgroundColor: Color.fromRGBO(100, 149, 237, 30),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
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
