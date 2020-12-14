import 'package:flutter/material.dart';

typedef callback = void Function(String);
typedef validatorF = String Function(String);

class FormInput{
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final String label;
  final String titel;
  final validatorF validator;
  bool isvalidate = false;
  FormInput({this.label,this.titel,this.validator, text = ""}){}

  FormInput copyWith({String text})
  {
    label: this.label;
    titel: this.titel;
    validator: this.validator;
  }
}