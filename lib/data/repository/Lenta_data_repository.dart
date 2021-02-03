import 'package:sbornik_pervokursnika/data/api/api_util.dart';
import 'package:sbornik_pervokursnika/domain/modle/Teg.dart';
import 'package:sbornik_pervokursnika/domain/modle/post.dart';
import 'package:sbornik_pervokursnika/domain/repository/Lenta_repository.dart';

class LentaDataRepository extends LentaRepository{
  final ApiUtil _apiUtil;

  List<Teg> _tegs = List<Teg>();

  LentaDataRepository(this._apiUtil);
  @override
  Future<List<Teg>> GetAllTegs()async{
    return _tegs.length == 0? await _apiUtil.GetTegs():_tegs;
  }

  @override
  Future<List<Teg>> AddTeg(String name)async{
    _tegs.where((e) => e.name == name).toList()[0].selected = true;
    await _apiUtil.AddTeg(name);
    return _tegs;
  }
  @override
  Future<List<Teg>> RemoveTeg(String name)async{
    _tegs.where((e) => e.name == name).toList()[0].selected = false;
    await _apiUtil.RemoveTeg(name);
    return _tegs;
  }

  @override
  Future<List<Post>> GetPosts()async{
    return await _apiUtil.GetPosts(_tegs);
  }
/*
  @override
  Future<void> AddtoFavorites(String postid)async{
    await _apiUtil.AddtoFavorites(postid);
  }

  @override
  Future<void> RemoveFavorites(String postid)async{
    await _apiUtil.RemoveFavorites(postid);
  }*/
}