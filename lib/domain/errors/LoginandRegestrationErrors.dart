

//Сообщение с текстом
class TextExeption implements Exception {
  TextExeption({this.text}) : super();
  final String text;
}

//Неверный пароль
class WorngPasswordExeption extends TextExeption {
  WorngPasswordExeption() : super(text: "Неверный пароль");
}

//Потльзователь не существует
class UserDotExistExeption extends TextExeption {
  UserDotExistExeption()
      : super(text: "Пользователь с таким именем не существует");
}

//Пользователь с таким именем уже существует
class UserAlreadyExistExeption extends TextExeption {
  UserAlreadyExistExeption()
      : super(text: "Пользователь с таким именем уже существует");
}