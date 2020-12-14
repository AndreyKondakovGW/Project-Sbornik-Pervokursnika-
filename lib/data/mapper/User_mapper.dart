import '../api/model/api_User.dart';
import '../../domain/modle/User.dart';

//Класс для преобразования объектов из слоя данных в обекты абстракции
class UserMapper{
  static User fromApi(ApiUser user)
  {
    return User(
      username: user.username,
      password: user.password,
      email: user.email,
    );
  }
}