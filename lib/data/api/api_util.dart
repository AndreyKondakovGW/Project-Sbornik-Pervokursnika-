import 'request/get_user_body.dart';
import '../mapper/User_mapper.dart';
import 'service/User_service.dart';
import '../../domain/modle/User.dart';
import 'package:meta/meta.dart';

class ApiUtil {
  final UserServicePlug _userService;
  //сменить на UserServiceMain _userService; когда будет готов бэк

  ApiUtil(this._userService);

  Future<User> Login({
    @required String usename,
    @required String password,
  }) async {
    final body = GetUserLoginBody(username: usename, password: password);
    try{
      final result = await _userService.Login(body);
      return UserMapper.fromApi(result);
    }catch(e)
    {
      throw e;
    }
  }

  Future<User> Registrate(
  {
    @required String usename,
    @required String password,
    @required String email,
  }) async {
    final body = GetUserRegistrBody(username: usename, password: password, email: email);
    try{
      final result = await _userService.Registrate(body);
      return UserMapper.fromApi(result);
    }catch(e)
    {
      throw e;
    }
  }

  Future<void> LogOut() async {
    await _userService.LogOut();
  }

}