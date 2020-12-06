import 'package:flutter/material.dart';
import 'ProfilePhoto.dart';
import 'ProfileFIO.dart';
import 'data/massOfStudents.dart';
import 'TegItemWidget.dart';
//////////////////////////////////////////
//
// ГЛАВНЫЙ ВИДЖЕТ СТРАНИЦЫ ПРОФИЛЬ
// TegItemWidget - ВИДЖЕТ ВЫБОРА ТЕГОВ
//
// StudentPhoto - ВИДЖЕТ ДЛЯ ФОТКИ СТУДЕНТА
// принимает аргументом имя файла в папке ассет
//
// ProfileFio - ВИДЖЕТ ДЛЯ ФИО СТУДЕНТА
// принимает парметр StudentsFIO описанный в файле Student.dart
//
/////////////////////////////////////////
class ProfilePage extends StatelessWidget {
  // final StudentInfo = StudentsMass.map((post) => ProfileFio(post)).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(children: [
        Container(
          color: Colors.black,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StudentPhoto(NameImage: 'profilephoto'),
                  ProfileFio(
                    studentsFIO: StudentsMass[0],
                  ),
                ],
              ),
              Container(
                  child: Text('ТЕГИ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22))),
              Column(
                  children: arraytegs
                      .map((listItem) => TegItemWidget(listItem))
                      .toList()),
            ],
          ),
        ),
      ]),
    );
  }
}
