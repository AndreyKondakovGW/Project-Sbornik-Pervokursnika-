part of 'lenta_bloc.dart';

@immutable
abstract class LentaState {}

class LentaInitial extends LentaState {
  LentaRepository lentaRepository;

  List<Teg> allTegs = List<Teg>(0); //все доступные категории

  List<Post> postStore =List<Post>(0);
  bool waitingresponce = false;
  //List<String> myTags; //выбранные категории

  LentaInitial({
    this.waitingresponce = false,
    this.allTegs,
    this.postStore,
    })
  {
    this.lentaRepository = RepositoryModule.lentaRepository();
  }

  LentaInitial addPosts({
    posts,
    })
  {
    return LentaInitial(
      allTegs: this.allTegs,
      postStore: this.postStore + posts,
    );
  }
}
