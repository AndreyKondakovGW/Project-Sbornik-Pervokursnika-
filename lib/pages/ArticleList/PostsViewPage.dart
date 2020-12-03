import 'package:flutter/material.dart';
import 'model/ListItem.dart';

var Mass = [
  ListItem(text: 'Промежуточная аттестация', route: '/attestat'),
  ListItem(text: 'Учебный год', route: '/study_plan'),
  ListItem(text: 'Права и обязанности студентов', route: '/prava_i_onbazonost'),
  ListItem(text: 'Академический отпуск', route: '/academ_otpysk')
];

class ArticleListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(100, 149, 237, 30),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          title: Text('Сборник первокурсника',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold))),
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
        Icon(Icons.arrow_forward),
        SizedBox(height: 15),
        InkWell(
            onTap: () => {Navigator.pushNamed(context, data.route)},
            child: Row(children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(100, 149, 237, 30),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  padding: EdgeInsets.all(20),
                  child: Row(children: [
                    Text(data.text,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ]),
                ),
              ),
            ])),
        Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(100, 149, 237, 120),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          height: 15,
          //color: Color.fromRGBO(100, 149, 237, 120),
        )
      ],
    );
  }
}
