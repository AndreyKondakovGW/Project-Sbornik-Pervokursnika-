import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/TegItem.dart';

var arraytegs = [
  TegItem(text: 'Стипендии'),
  TegItem(text: 'Общежития'),
  TegItem(text: 'Экзамены'),
  TegItem(text: 'ЧГК')
];
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
              padding: EdgeInsets.all(6),
              child: Stack(children: [
                Container(padding: EdgeInsets.only(top: 13),
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