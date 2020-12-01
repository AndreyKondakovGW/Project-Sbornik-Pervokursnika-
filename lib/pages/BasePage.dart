import 'package:flutter/material.dart';
import 'package:sbornik_pervokursnika/pages/LentaPage.dart';
import 'ProfilePage.dart';
import 'PostsViewPage.dart';
import 'FacultiesPage.dart';
import 'FavoritesPage.dart';

//Виджет с навбаром
class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int currentIdex = 0;
  _NavPageState();

  final titels = [
    "Сборник первокурсника",
    "Избраное",
    "Лента",
    "Профиль",
    "Факультет",
  ];

  final routes = [
    '/home',
    '/favorites',
    '/lenta',
    '/profile',
    '/faculty',
  ];

  final children = [
    SbornikPage(),
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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        title: Text(titels[currentIdex]),
      ),
      body: children[currentIdex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIdex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: "Сборник",
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Избраное",
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: "Лента",
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.portrait),
            label: "Профиль",
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Факультет",
            backgroundColor: Colors.blueAccent,
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIdex = index;
          });
        },
      ),
    );
  }
}
