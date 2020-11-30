import 'package:flutter/material.dart';

class SbornikPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       Color.fromRGBO(89, 31, 129, 10),
          //       //Color.fromRGBO(0, 0, 0, 10),
          //       Color.fromRGBO(0, 0, 0, 10),
          //     ]),
          color: Colors.black,
        ),
        child: ListView(
          children: [
            Container(
                child: Text('Промежуточная аттестация'), color: Colors.yellow),
            Divider(color: Colors.yellow),
            Container(
              child: Text('Учебный план'),
              color: Colors.yellow,
            ),
            Divider(color: Colors.yellow),
            Container(
                child: Text('Права и обязанности студентов'),
                color: Colors.yellow),
            Divider(color: Colors.yellow),
            Container(
              child: Text('Академический отпуск'),
              color: Colors.yellow,
            ),
            Divider(color: Colors.yellow)
          ],
        ),
      ),
    );
  }
}
