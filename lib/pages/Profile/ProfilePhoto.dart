import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StudentPhoto extends StatelessWidget{
  final String NameImage;

  StudentPhoto({this.NameImage});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage('assets/images/$NameImage.jpg'),
      radius: 100,

    );
  }
}