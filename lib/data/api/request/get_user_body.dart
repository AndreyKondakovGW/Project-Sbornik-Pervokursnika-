import 'package:meta/meta.dart';

//Здесь преведены классы создающие тела запросов для бэка при Входе/Регистрации

class GetUserLoginBody{
  final String username;
  final String password;
  GetUserLoginBody({
    @required this.username,
    @required this.password,
  });

  //Метод формирующий JASON дял отправки на бэк
  //Реализовать когда будет известно АПИ
  Map<String, dynamic> toApi() {
    return {
      'name' : username,
      'pass' : password,
      'formatted' : 0,
    };
  }
}

class GetUserRegistrBody{
  final String username;
  final String password;
  final String email;
  GetUserRegistrBody({
    @required this.username,
    @required this.password,
    @required this.email,
  });

  //Метод формирующий JASON дял отправки на бэк
  //Реализовать когда будет известно АПИ
  Map<String, dynamic> toApi() {
    return {
      'name' : username,
      'pass' : password,
      'email' :email,
      'formatted' : 0,
    };
  }
}