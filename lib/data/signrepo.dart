import 'package:meta/meta.dart';
import 'dart:async';

import 'package:sbornik_pervokursnika/data/models/LoginadnRegestrationmodels/User.dart';

User currentuser = null;

List<User> usersBase = [
  User(
    username: "admin",
    password: "123",
    email: "andreykondakov2302@gmail.com"),
  User(
    username: "godizigel",
    password: "111",
    email: "godsegel23@gmail.com")
];


//Сообщение с текстом
class TextExeption implements Exception
{
  TextExeption({this.text}):super();
  final String text;
}

//Неверный пароль
class WorngPasswordExeption extends TextExeption
{
  WorngPasswordExeption():super(text: "Не верный пароль");
}

//Потльзователь не существует
class UserDotExistExeption extends TextExeption
{
  UserDotExistExeption():super(text: "Пользователь с таким именем не существует");
}

//Пользователь с таким именем уже существует
class UserAlreadyExistExeption extends TextExeption
{
  UserAlreadyExistExeption():super(text: "Пользователь с таким именем уже существует");
}

Future<void> LogInWithNameandPassowrd({
  @required String username,
  @required String password,
})async
{
  User user = await TryToLogIn(
  username: username,
  password: password,
  );
  if (user != null)
      {
        if (user.password == password)
        {
          print("Successt!");
          currentuser = user;
        }
        else{
          throw WorngPasswordExeption();
        }
      }
      else{
        throw UserDotExistExeption();
      }
}

Future<User> TryToLogIn({username,password}) =>
    Future.delayed(Duration(seconds: 1), (){
      return usersBase.toList().firstWhere((elm) => (elm.username == username),orElse: () => null);
    });

Future<bool> UserAlreadyExists({username}) =>
    Future.delayed(Duration(seconds: 3), (){
      return usersBase.toList().where((elm) => (elm.username == username)).length > 0;
    });


Future<void> Regestrate({
  @required String username,
  @required String password,
  @required String email,
})async
{
  bool b = await UserAlreadyExists(username:username);
  if (b)
  {
    throw UserAlreadyExistExeption();
  }
  else
  {
    User user = User(username: username,password: password, email: email);
    usersBase.add(user);
    currentuser = user;
  }
}
  

