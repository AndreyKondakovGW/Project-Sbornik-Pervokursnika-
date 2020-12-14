import 'package:flutter/material.dart';

//Виждет загрузчика
class WaitingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/images/loadingblack.gif",
            height: 125.0,
            width: 125.0,
          )
        ])
      ]),
    ));
  }
}