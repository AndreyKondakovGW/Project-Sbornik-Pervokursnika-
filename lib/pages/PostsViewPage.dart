import 'package:flutter/material.dart';
import 'package:sbornik_pervokursnika/data/models/ListItem.dart';

var Mass = [
  ListItem(text: 'Промежуточная аттестация', route: '/attestat'),
  ListItem(text: 'Учебный план', route: '/attestat'),
  ListItem(text: 'Промежуточная аттестация', route: '/attestat'),
  ListItem(text: 'Промежуточная аттестация', route: '/attestat')
];

class SbornikPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          children: Mass.map((listItem) => ListItemWidget(listItem)).toList()),
    );
  }
}

class ListItemWidget extends StatelessWidget {
  final ListItem data;
  ListItemWidget(this.data);

  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {Navigator.pushNamed(context, data.route)},
      child: Container(child: Text(data.text), color: Colors.yellow),
    );
  }
}
