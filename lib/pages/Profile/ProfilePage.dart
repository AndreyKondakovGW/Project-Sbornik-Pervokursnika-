import 'package:flutter/material.dart';
import 'TegItem.dart';

var arraytegs = [
  TegItem(text: 'Стипендии'),
  TegItem(text: 'Общежития'),
  TegItem(text: 'Экзамены'),
  TegItem(text: 'ЧГК')
];

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            color: Colors.black,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                    child: Text('Теги',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22))),
                Column(
                    children: arraytegs
                        .map((listItem) => TegItemWidget(listItem))
                        .toList()),
              ],
            )));
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
                  child: Text(data.text,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                CheckWidget(),
              ]),
            ),
          ),
        ]),
      ],
    );
  }
}

class CheckWidget extends StatefulWidget {
  @override
  _CheckWidgetState createState() => _CheckWidgetState();
}

class _CheckWidgetState extends State<CheckWidget> {
  bool _isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: IconButton(
        icon: (_isCheck
            ? Icon(Icons.check_box, size: 25)
            : Icon(Icons.check_box_outline_blank, size: 25)),
        onPressed: _tapCheck,
        color: Colors.white,
      ),
    );
  }

  void _tapCheck() {
    setState(() {
      if (_isCheck) {
        _isCheck = false;
      } else {
        _isCheck = true;
      }
    });
  }
}
