import 'package:flutter/material.dart';
import '../../domain/modle/TegItem.dart';
import 'BasePage.dart';

var arraytegs = [
  TegItem(text: 'Стипендии'),
  TegItem(text: 'Общежития'),
  TegItem(text: 'Экзамены'),
  TegItem(text: 'ЧГК')
];

//import 'ProfilePhoto.dart';
//import 'ProfileFIO.dart';
//import 'data/massOfStudents.dart';
//import 'TegItemWidget.dart';
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
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //StudentPhoto(NameImage: 'profilephoto'),
              //ProfileFio(
                //studentsFIO: StudentsMass[0],
              //),
            ],
          ),
          Container(
            child: Text('Теги',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22
              )
          )
        ),
        Column(
          children: arraytegs
          .map((listItem) => TegItemWidget(listItem))
          .toList()),
        ],
      )
    );
  }
}

class TegItemWidget extends StatelessWidget {
  final TegItem data;
  TegItemWidget(this.data);

  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Row(children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(100, 149, 237, 30),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              padding: EdgeInsets.all(10),
              child: Stack(children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(data.text),
                ),
              ],
            ),
          ),
          ),
        ]),
      ]);
  }
}
