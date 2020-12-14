import 'package:meta/meta.dart';
import '../modle/User.dart';

//Интерфейс репозитория пользователя
abstract class UserRepository{
  User GetCurrentUser();

  Future<void> LogInWithNameandPassowrd({
    @required String username,
    @required String password,
  }); 

  Future<void> Regestrate({
    @required String username,
    @required String password,
    @required String email,
  });  
}