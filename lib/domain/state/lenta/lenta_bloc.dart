import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sbornik_pervokursnika/domain/modle/Teg.dart';
import 'package:sbornik_pervokursnika/domain/modle/post.dart';
import 'package:sbornik_pervokursnika/domain/repository/Lenta_repository.dart';

import '../../../internal/dependencies/repository_module.dart';

part 'lenta_event.dart';
part 'lenta_state.dart';

class LentaBloc extends Bloc<LentaEvent, LentaInitial> {
  LentaBloc() : super(LentaInitial(allTegs: [], postStore: []));

  @override
  Stream<LentaInitial> mapEventToState(
    LentaEvent event,
  ) async* {
    if (event is DownloadInitialData)
    {
      print("DownloadInitialData");
      yield LentaInitial(waitingresponce: true, allTegs: state.allTegs, postStore: state.postStore);
      final tegs = await state.lentaRepository.GetAllTegs();
      final posts =  await state.lentaRepository.GetPosts();
      yield LentaInitial(waitingresponce: false, allTegs: tegs, postStore: posts);
    }
    if (event is AddTeg)
    {
      print("AddTeg");
      yield LentaInitial(waitingresponce: true, allTegs: state.allTegs, postStore: state.postStore);
      final tegs = await state.lentaRepository.AddTeg(event.teg);
      final posts =  await state.lentaRepository.GetPosts();
      yield LentaInitial(waitingresponce: false, allTegs: tegs, postStore: posts);
    }
    if (event is RemoveTeg)
    {
      print("RemoveTeg");
      yield LentaInitial(waitingresponce: true, allTegs: state.allTegs, postStore: state.postStore);
      final tegs = await state.lentaRepository.RemoveTeg(event.teg);
      final posts =  await state.lentaRepository.GetPosts();
      yield LentaInitial(waitingresponce: false, allTegs: tegs, postStore: posts);
    }
    if (event is AddPosts)
    {
      print("AddPosts");
      //yield LentaInitial(waitingresponce: true, allTegs: state.allTegs, postStore: state.postStore);
      final posts =  await state.lentaRepository.GetPosts();
      state.postStore += posts;
      //yield state.addPosts(posts: posts);
    }
  }
}
