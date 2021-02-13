import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sbornik_pervokursnika/domain/modle/Teg.dart';
import 'package:sbornik_pervokursnika/domain/modle/post.dart';
import 'package:sbornik_pervokursnika/domain/repository/Lenta_repository.dart';

import '../../../internal/dependencies/repository_module.dart';

part 'lenta_event.dart';
part 'lenta_state.dart';

class LentaBloc extends Bloc<LentaEvent, LentaState> {
  LentaBloc() : super(LentaUninitialized());

  @override
  LentaState get initialState => LentaUninitialized();

  @override
  Stream<LentaState> mapEventToState(
    LentaEvent event,
  ) async* {
    if (event is AddPosts && !_hasReachedMax(state))
    {
      try{
        if (state is LentaUninitialized)
        {
          final tegs = await state.lentaRepository.GetAllTegs();
          print("dd");
          final posts =  await state.lentaRepository.GetPosts(null);
          print(posts.length);
          yield LentaPostLoaded(hasReachedMax: false, allTegs: tegs, postStore: posts);
          return;
        }
        if (state is LentaPostLoaded)
        {
          final curstate = state as LentaPostLoaded;
          final posts = await state.lentaRepository.GetPosts(curstate.postStore.last.time);
          if (posts.length == 0){
            yield curstate.copyWith(hasReachedMax: true);
          }
          else{
            yield LentaPostLoaded(hasReachedMax: false, postStore: curstate.postStore + posts, allTegs: curstate.allTegs);
          }
        }
      }catch(_)
      {
        yield PostError("");
      }
    }
    if (event is AddTeg)
    {
      print("add teg ${event.teg}");
      final tegs = await state.lentaRepository.AddTeg(event.teg);
      final posts =  await state.lentaRepository.GetPosts(null);
      final curstate = state as LentaPostLoaded;
      yield posts.length == 0?
            curstate.copyWith(hasReachedMax: true, posts: posts):
            LentaPostLoaded(
              hasReachedMax: false, postStore: posts, allTegs: tegs
            );
    }
    if (event is RemoveTeg)
    {
      print("remove teg ${event.teg}");
      final tegs = await state.lentaRepository.RemoveTeg(event.teg);
      final posts =  await state.lentaRepository.GetPosts(null);
      final curstate = state as LentaPostLoaded;
      yield posts.length == 0?
            curstate.copyWith(hasReachedMax: true, posts: posts):
            LentaPostLoaded(
              hasReachedMax: false, postStore: posts, allTegs: tegs
            );
    }
  }

  bool _hasReachedMax(LentaState state){
    return state is LentaPostLoaded && state.hasReachedMax;
  }
}
