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
    return Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: Mass.map((listItem) => ListItemWidget(listItem)).toList(),
        ));
  }
}

class ListItemWidget extends StatelessWidget {
  final ListItem data;
  ListItemWidget(this.data);

  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {Navigator.pushNamed(context, data.route)},
        child: Row(
            //mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  padding: EdgeInsets.all(20),
                  child: Text(data.text),
                  color: Colors.blue),
            ]));
  }
}
