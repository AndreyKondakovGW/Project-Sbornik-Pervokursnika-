import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sbornik_pervokursnika/data/SignFormblock/formblock_bloc.dart';
import 'package:sbornik_pervokursnika/data/models/LoginadnRegestrationmodels/FormInput.dart';
import 'package:sbornik_pervokursnika/data/signrepo.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _paswordcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FormblockBloc block = BlocProvider.of(context);
    return BlocConsumer<FormblockBloc, FormblockInitial>(
        listener: (context, state) {
      if (currentuser != null) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    }, builder: (context, state) {
      switch (state.currstare) {
        case LoginandRegestrationState.Login:
          return Container(
              color: Colors.black,
              child: Column(
                children: [
                  Column(
                    children: [
                      state.errorrequest ? Text(state.errortext) : Container()
                    ],
                  ),
                  //Инпут для Логина
                  Container(
                    padding: EdgeInsets.all(15),
                    child: InputWiget(
                      controler: _usernamecontroller,
                      titel: state.siginInusername.titel,
                      lable: state.siginInusername.label,
                      key1: state.siginInusername.key,
                      validator: state.siginInusername.validator,
                    ),
                  ),
                  //Инпут для пароля
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(25))),
                    child: InputWiget(
                      controler: _paswordcontroller,
                      titel: state.siginInpassword.titel,
                      lable: state.siginInpassword.label,
                      key1: state.siginInpassword.key,
                      validator: state.siginInpassword.validator,
                    ),
                  ),

                  RaisedButton(
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: const Text(
                      'Вход',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      block.add(SendSignInForm(
                          username: _usernamecontroller.text,
                          password: _paswordcontroller.text));
                    },
                  ),

                  RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
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
        case LoginandRegestrationState.Regestration:
          return Container(
              color: Colors.white,
              child: Column(children: [
                Column(
                  children: [
                    state.errorrequest
                        ? Text(
                            state.errortext,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )
                        : Container()
                  ],
                ),
                //Инпут для Логина
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(15),
                  child: InputWiget(
                    controler: _usernamecontroller,
                    titel: state.siginUpusername.titel,
                    lable: state.siginUpusername.label,
                    key1: state.siginUpusername.key,
                    validator: state.siginUpusername.validator,
                  ),
                ),
                //Инпут для имайла
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(15),
                  child: InputWiget(
                    controler: _emailcontroller,
                    titel: state.siginUpemail.titel,
                    lable: state.siginUpemail.label,
                    key1: state.siginUpemail.key,
                    validator: state.siginUpemail.validator,
                  ),
                ),
                //Инпут для пароля
                Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(15),
                  child: InputWiget(
                    controler: _paswordcontroller,
                    titel: state.siginUppassword.titel,
                    lable: state.siginUppassword.label,
                    key1: state.siginUppassword.key,
                    validator: state.siginUppassword.validator,
                  ),
                ),
                Expanded(
                    child: Container(
                        color: Colors.black,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RaisedButton(
                                      color: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: const Text(
                                        'Зарегистрироваться',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      onPressed: () {
                                        block.add(SendSignUpForm(
                                            username: _usernamecontroller.text,
                                            password: _paswordcontroller.text,
                                            email: _emailcontroller.text));
                                      }),
                                  RaisedButton(
                                      color: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: const Text(
                                        'Вход',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      onPressed: () {
                                        block.add(StartLogin());
                                      }),
                                ],
                              )
                            ])))
              ]));

        case LoginandRegestrationState.Waiting:
          return _WaitingWidget();
        default:
      }
    });
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
        color: Colors.blue,
        child: Column(
          children: [
            Text(
              titel,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Container(
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.all(Radius.circular(15))),
              color: Colors.white,
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: key1,
                child: TextFormField(
                  controller: controler,
                  validator: validator,
                  decoration: InputDecoration(
                    //fillColor: Colors.white,
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

//Виждет загрузчика
class _WaitingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: Colors.black,
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
