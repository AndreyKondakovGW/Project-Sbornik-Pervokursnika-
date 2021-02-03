import 'package:flutter/material.dart';
import '../domain/state/loginregistration/formblock_bloc.dart';
import '../domain/modle/FormInput.dart';

class LoginFormWidget extends StatelessWidget {
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _paswordcontroller = TextEditingController();
  final state;
  final block;

  LoginFormWidget({this.state, this.block});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        state.errorrequest ? _ErrorWidget(state.errortext) : Container(),
        //Инпут для Логина
        InputWiget(
          controler: _usernamecontroller,
          titel: state.siginInusername.titel,
          lable: state.siginInusername.label,
          key1: state.siginInusername.key,
          validator: state.siginInusername.validator,
        ),
        //Инпут для пароля
        InputWiget(
          controler: _paswordcontroller,
          titel: state.siginInpassword.titel,
          lable: state.siginInpassword.label,
          key1: state.siginInpassword.key,
          validator: state.siginInpassword.validator,
        ),
        RaisedButton(
          color: Color.fromRGBO(100, 149, 237, 30),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Text(
            'Вход',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          onPressed: () {
            block.add(SendSignInForm(
                username: _usernamecontroller.text,
                password: _paswordcontroller.text));
          },
        ),
        RaisedButton(
          color: Color.fromRGBO(100, 149, 237, 30),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Text(
            'Войти как гость',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          onPressed: () {
            block.add(LogInasGuest());
          },
        ),
        RaisedButton(
            color: Color.fromRGBO(100, 149, 237, 30),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: const Text(
              'Регистрация',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            onPressed: () {
              block.add(StartRegestration());
            }),
      ],
    ));
  }
}

class RegistrationFormWidget extends StatelessWidget {
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _paswordcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final state;
  final block;

  RegistrationFormWidget({this.state, this.block});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      state.errorrequest ? _ErrorWidget(state.errortext) : Container(),
      //Инпут для Логина
      InputWiget(
        controler: _usernamecontroller,
        titel: state.siginUpusername.titel,
        lable: state.siginUpusername.label,
        key1: state.siginUpusername.key,
        validator: state.siginUpusername.validator,
      ),
      //Инпут для имайла
      InputWiget(
        controler: _emailcontroller,
        titel: state.siginUpemail.titel,
        lable: state.siginUpemail.label,
        key1: state.siginUpemail.key,
        validator: state.siginUpemail.validator,
      ),
      //Инпут для пароля
      InputWiget(
        controler: _paswordcontroller,
        titel: state.siginUppassword.titel,
        lable: state.siginUppassword.label,
        key1: state.siginUppassword.key,
        validator: state.siginUppassword.validator,
      ),
      RaisedButton(
          color: Color.fromRGBO(100, 149, 237, 30),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Text(
            'Зарегистрироваться',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          onPressed: () {
            block.add(SendSignUpForm(
                username: _usernamecontroller.text,
                password: _paswordcontroller.text,
                email: _emailcontroller.text));
          }),
      RaisedButton(
          color: Color.fromRGBO(100, 149, 237, 30),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Text(
            'Вход',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          onPressed: () {
            block.add(StartLogin());
          }),
    ]));
  }
}

//Виджет Инпут Формы полей регистрации и Ввода
class InputWiget extends StatelessWidget {
  final TextEditingController controler;
  final String titel;
  final String lable;
  final validatorF validator;
  final GlobalKey<FormState> key1;

  InputWiget(
      {this.controler, this.titel, this.lable, this.validator, this.key1});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Color.fromRGBO(100, 149, 237, 30),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                titel,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(224, 255, 255, 80),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: key1,
                child: TextFormField(
                  controller: controler,
                  validator: validator,
                  decoration: InputDecoration(
                    labelText: lable,
                    helperText: '',
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

//Виждет виджет сообщения об ошибке
class _ErrorWidget extends StatelessWidget {
  final String text;

  _ErrorWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 10),
      child: Text(text, style: TextStyle(color: Colors.red, fontSize: 16)),
    );
  }
}
