part of 'formblock_bloc.dart';

@immutable
abstract class FormblockState {}

enum LoginandRegestrationState { Login,Regestration,Waiting }

//Регекс для электронной почты
RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

class FormblockInitial extends FormblockState {
  //Поля Входа
  FormInput siginInusername;
  FormInput siginInpassword;

  //Поля регистрации
  FormInput siginUpusername;
  FormInput siginUpemail;
  FormInput siginUppassword;
  final String errortext;
  final bool errorrequest;
  final LoginandRegestrationState currstare;

  FormblockInitial({
    this.errortext = "",
    this.errorrequest = false,
    this.currstare = LoginandRegestrationState.Login,
  }){
    this.siginInusername =siginInusername ?? FormInput(
    titel: "ЛОГИН",
    label: "Введите ваш логин",
    validator: (s) {
      return ((s.length > 2) && (s.length < 10))?null: "Логин слишком короткий или слишком длинный";
    },
  );

  this.siginInpassword = siginInpassword ?? FormInput(
    titel: "ПАРОЛЬ",
    label: "Введите ваш пароль",
    validator: (s) {
      return ((s.length > 2) && (s.length < 10))?null: "Пароль слишком короткий или слишком длинный";
    },
  );

  //Поля регистрации
  this.siginUpusername =siginUpusername ?? FormInput(
    titel: "ЛОГИН",
    label: "Придумайте ваш логин",
    validator: (s) {
      return ((s.length > 2) && (s.length < 10))?null: "Придуманный Логин слишком короткий или слишком длинный";
    },
  );

  this.siginUpemail =siginUpemail ?? FormInput(
    titel: "EMAIL",
    label: "Укажите ваш адрес электронной почты",
    validator: (s) {
      return (_emailRegExp.hasMatch(s))?null:"Емайл не соответствует формату";
    },
  );

  this.siginUppassword =siginUppassword ?? FormInput(
    titel: "ПАРОЛЬ",
    label: "Придумайте ваш пароль",
    validator: (s) {
      return ((s.length > 2) && (s.length < 10))?null: "Придуманный Пароль слишком короткий или слишком длинный";
    },
  );
  }

  FormblockInitial copyWith({
    String errortext,
    bool errorrequest,
    LoginandRegestrationState currstate,
  })
  {
    return FormblockInitial(
      errortext: errortext ?? this.errortext,
      errorrequest: errorrequest ?? this.errorrequest,
      currstare: currstare ?? this.currstare,
    );
  }
}
