import 'dart:async';

import 'package:sbornik_pervokursnika/domain/modle/Teg.dart';
import '../modle/post.dart';

///Интерфейс репозитория ленты
abstract class LentaRepository{
  ///Предоставляет список всех тэгов
  Future<List<Teg>> GetAllTegs();

  ///Добовляет тэг в список тэгов по которым строится лента
  Future<List<Teg>> AddTeg(String name);
  ///Добовляет тэг в список тэгов по которым строится лента
  Future<List<Teg>> RemoveTeg(String name);

  ///Загружает посты ленты с бэкэнда
  Future<List<Post>> GetPosts();
  
  ///добовляет пост в избраное
  //Future<void> AddtoFavorites(String postid);
  ///убирает пост из избраного
  //Future<void> RemoveFavorites(String postid); 

}