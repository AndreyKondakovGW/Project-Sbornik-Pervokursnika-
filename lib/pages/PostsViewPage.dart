import 'package:flutter/material.dart';
import 'package:sbornik_pervokursnika/data/models/ListItem.dart';

var Mass = [
  ListItem(text: 'Промежуточная аттестация', route: '/attestat'),
  ListItem(text: 'Учебный год', route: '/study_plan'),
  ListItem(text: 'Права и обязанности студентов', route: '/prava_i_onbazonost'),
  ListItem(text: 'Академический отпуск', route: '/academ_otpysk')
];

class SbornikPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          title: Text('Сборник первокурсника',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))),
      body: Container(
          color: Colors.black,
          padding: EdgeInsets.all(25),
          child: Column(
            children: Mass.map((listItem) => ListItemWidget(listItem)).toList(),
          )),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final ListItem data;
  ListItemWidget(this.data);

  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        InkWell(
            onTap: () => {Navigator.pushNamed(context, data.route)},
            child: Row(children: [
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text(data.text),
                    color: Colors.blue),
              ),
            ])),
      ],
    );
  }
}
