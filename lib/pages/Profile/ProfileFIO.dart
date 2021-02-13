import 'package:flutter/material.dart';
import 'model/Students.dart';

class ProfileFio extends StatelessWidget{

  final StudentsFIO studentsFIO;
  TextStyle _style(){
    return TextStyle(
        fontFamily: 'Tahoma',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.white
    );
  }
  const ProfileFio({this.studentsFIO});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(studentsFIO.lastndname, style: _style()),
            Text(studentsFIO.firstname, style: _style()),
            Text(studentsFIO.midletname, style: _style()),
          ],
        ),
    );

  }

}