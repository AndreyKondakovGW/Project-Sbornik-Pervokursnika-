import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sbornik_pervokursnika/data/bloc/formblock_bloc.dart';
import 'package:sbornik_pervokursnika/data/models/LoginadnRegestrationmodels/FormInput.dart';
import 'package:sbornik_pervokursnika/data/signrepo.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _paswordcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context){
    FormblockBloc block = BlocProvider.of(context);
    return BlocConsumer<FormblockBloc,FormblockInitial>(
      listener: (context, state) {
        if (currentuser != null)
        {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }
      },
      builder: (context, state) {
        switch (state.currstare) {
          case LoginandRegestrationState.Login:
            return Column(
              children: [
                Column(
                  children: [state.errorrequest? Text(state.errortext) : Container()],
                ),
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
                FlatButton(
                  child: const Text('Вход'),
                  onPressed:(){
                    block.add(SendSignInForm(username: _usernamecontroller.text, password: _paswordcontroller.text));},
                ),
                FlatButton(
                  child: const Text('Регистрация'),
                  onPressed:(){
                    block.add(StartRegestration());
                  }
                ),
              ],
            );
          case LoginandRegestrationState.Regestration:
            return Column(
              children: [
                Column(
                  children: [state.errorrequest? Text(state.errortext) : Container()],
                ),
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
                FlatButton(
                  child: const Text('Зарегистрироваться'),
                  onPressed:(){
                    block.add(SendSignUpForm(username: _usernamecontroller.text, password: _paswordcontroller.text,email: _emailcontroller.text));
                  }
                ),
                FlatButton(
                  child: const Text('Вход'),
                  onPressed:(){
                    block.add(StartLogin());
                  }
                ),
              ],
            );
          case LoginandRegestrationState.Waiting:
            return _WaitingWidget();
          default:
        }
      }
    );
  }
}


//Виджет Инпут Формы полей регистрации и Ввода
class InputWiget extends StatelessWidget
{
  final TextEditingController controler;
  final String titel;
  final String lable;
  final validatorF validator;
  final GlobalKey<FormState> key1;

  InputWiget({this.controler, this.titel,this.lable,this.validator,this.key1});

  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
      Text(
        titel,
      ),
      Form(
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
    ],
  );
  }
}


//Виждет загрузчика
class _WaitingWidget extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.amber,
      ),
    );
  }
}

