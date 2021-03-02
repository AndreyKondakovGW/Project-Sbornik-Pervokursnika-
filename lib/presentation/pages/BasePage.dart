import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'LentaPage.dart';
import 'SbornikPageMenu.dart';
import 'ProfilePage.dart';
import 'FacultiesPage.dart';
import 'FavoritesPage.dart';

//Базовая страница
class BasePage extends StatelessWidget {
  final Widget body;
  final String titel;
  final Widget navbar;
  BasePage({this.body, this.titel, this.navbar = null});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black26,
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
        title: Text(titel),
      ),
      body: body,
      bottomNavigationBar: navbar,
    );
  }
}

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

  final children = [
    SbornikMenuPage(),
    FavoritesPage(),
    LentaPage(),
    ProfilePage(),
    FacultiesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BasePage(
      titel: titels[currentIdex],
      body: children[currentIdex],
      navbar: Container(
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
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "Избраное",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books),
              label: "Лента",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.portrait),
              label: "Профиль",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Факультет",
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
