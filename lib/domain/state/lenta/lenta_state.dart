part of 'lenta_bloc.dart';

@immutable
abstract class LentaState {
  LentaRepository lentaRepository = RepositoryModule.lentaRepository();
}

class LentaUninitialized extends LentaState {}

class PostError extends LentaState {
  String message;

  PostError(this.message);
}

class EmptyLenta extends LentaState{}

class LentaPostLoaded extends LentaState {

  List<Teg> allTegs;
  List<Post> postStore;
  bool hasReachedMax;

  LentaPostLoaded({
    this.hasReachedMax,
    this.allTegs,
    this.postStore,
  }){
    this.postStore.sort((p1,p2) => p1.time.compareTo(p2.time));
  }

  LentaPostLoaded copyWith({
    List<Post> posts,
    bool hasReachedMax,
  }) {
    return LentaPostLoaded(
      postStore: posts ?? this.postStore,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  LentaPostLoaded addPosts({
    posts,
    })
  {
    return LentaPostLoaded(
      allTegs: this.allTegs,
      postStore: this.postStore + posts,
    );
  }
}
