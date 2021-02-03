import 'package:meta/meta.dart';
import '../modle/User.dart';

///Интерфейс репозитория пользователя
abstract class UserRepository{
  ///Возвращает текущего зарегистрированного пользователя
  User GetCurrentUser();

  ///Является ли Юзер Гостем
  bool UserIsGuest();

  ///Отправляет запрос к бэкэнду на вход
  Future<void> LogInWithNameandPassowrd({
    @required String username,
    @required String password,
  }); 

  ///Отправляет запрос к бэкэнду на регистрацию
  Future<void> Regestrate({
    @required String username,
    @required String password,
    @required String email,
  });
  
  ///Отправляет запрос на регистрацию гостем
  Future<void> LogInasGuest();

}