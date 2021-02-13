import 'package:sbornik_pervokursnika/data/api/request/get_lenta_request_body.dart';
import 'package:sbornik_pervokursnika/data/api/service/Lenta_service.dart';
import 'package:sbornik_pervokursnika/data/mapper/Post_mapper.dart';
import 'package:sbornik_pervokursnika/data/mapper/Teg_mapper.dart';
import 'package:sbornik_pervokursnika/domain/modle/Teg.dart';
import 'package:sbornik_pervokursnika/domain/modle/post.dart';

import 'request/get_user_body.dart';
import '../mapper/User_mapper.dart';
import 'service/User_service.dart';
import '../../domain/modle/User.dart';
import 'package:meta/meta.dart';

class ApiUtil {
  ///Временный сервис для работы без бэка
  final UserServicePlug _userService;

  ///Временный сервис для работы без бэка
  final LentaServicePlug _lentaService;
  //сменить на UserServiceMain _userService; когда будет готов бэк

  ApiUtil(this._userService, this._lentaService);

  //Функции userService

  Future<User> Login({
    @required String usename,
    @required String password,
  }) async {
    final body = GetUserLoginBody(username: usename, password: password);
    try {
      final result = await _userService.Login(body);
      return UserMapper.fromApi(result);
    } catch (e) {
      throw e;
    }
  }

  Future<User> Registrate({
    @required String usename,
    @required String password,
    @required String email,
  }) async {
    final body =
        GetUserRegistrBody(username: usename, password: password, email: email);
    try {
      final result = await _userService.Registrate(body);
      return UserMapper.fromApi(result);
    } catch (e) {
      throw e;
    }
  }

  Future<void> LogOut() async {
    await _userService.LogOut();
  }

  //Функции lentaService

  Future<List<Teg>> GetTegs() async {
    print("GetTegs");
    final result = await _lentaService.GetTegs();
    return TegMapper.fromApi(result);
  }

  Future<void> AddTeg(String name) async {
    await _lentaService.AddTeg(name);
  }

  Future<void> RemoveTeg(String name) async {
    await _lentaService.RemoveTeg(name);
  }

  Future<List<Post>> GetPosts(List<Teg> tegs, DateTime timeofLastPost) async {
    print("GetPosts $timeofLastPost");
    final body = GetPostRequestBody(tegs: tegs, time: timeofLastPost);
    try {
      print(body.time);
      final result = await _lentaService.GetPosts(body);
      return PostMapper.fromApi(result);
    } catch (e) {
      print(e);
    }
  }
/*
  Future<void> AddtoFavorites(String postid)
  async{
    await _lentaService.AddtoFavorites(postid);
  }

  Future<void> RemoveFavorites(String postid)
  async{
    await _lentaService.AddtoFavorites(postid);
  }*/
}
