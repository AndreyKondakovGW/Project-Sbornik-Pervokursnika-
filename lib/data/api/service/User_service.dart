import '../model/api_User.dart';
import '../request/get_user_body.dart';
import '../../../domain/errors/LoginandRegestrationErrors.dart';

//Сервис для решистрации входа пользователей через бэкэнд
//Будет написан когда будет известно АПИ сервера
class UserServiceMain {
  static const BASE_URL = '';
  /*Future<ApiUser> TrytoLogin(GetUserLoginBody body) async {
    //запрос на сервер
    final response = awit ...(
      '/json',
      ... body.toApi(),
    );
    return ApiUser.fromApi(response.data);
  }
  Future<ApiUser> TryRegistrate(GetUserRegistrBody body){}
  Future<void> LogOut(){}
  */
}

//временная заглушка сервиса выполненая в виде массива
class UserServicePlug{
  final List<ApiUser> usersBase = [
  ApiUser.fromApi(
      username: "admin",
      password: "123",
      email: "andreykondakov2302@gmail.com"),
  ApiUser.fromApi(
    username: "godizigel",
    password: "111",
    email: "godsegel23@gmail.com")
  ];


  Future<ApiUser> Login(GetUserLoginBody body)
  async {
    ApiUser user = await TryToLogIn(
      username: body.toApi()['name'],
    );
    if (user != null) {
      if (user.password == body.toApi()['pass']) {
        print("Successt!");
        return user;
      } else {
        throw WorngPasswordExeption();
      }
    }else {
      throw UserDotExistExeption();
    }
  }


  Future<ApiUser> TryToLogIn({username, password}) =>
    Future.delayed(Duration(seconds: 1), () {
      return usersBase
          .toList()
          .firstWhere((elm) => (elm.username == username), orElse: () => null);
  });


  Future<bool> UserAlreadyExists({username}) =>
    Future.delayed(Duration(seconds: 3), () {
      return usersBase
              .toList()
              .where((elm) => (elm.username == username))
              .length >
          0;
    });

  Future<ApiUser> Registrate(GetUserRegistrBody body)
  async {
    bool b = await UserAlreadyExists(username: body.toApi()["name"]);
    if (b) {
      throw UserAlreadyExistExeption();
    } else {
      ApiUser user = ApiUser.fromApi(username: body.toApi()["name"] , password: body.toApi()["pass"], email: body.toApi()["email"]);
      usersBase.add(user);
      return user;
    }
  }


  Future<void> LogOut(){

  }

}

