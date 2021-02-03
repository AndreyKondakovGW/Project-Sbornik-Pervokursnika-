part of 'lenta_bloc.dart';

@immutable
abstract class LentaEvent {}

class DownloadInitialData extends LentaEvent{}

class AddTeg extends LentaEvent{
  final String teg;

  AddTeg(this.teg);
}

class RemoveTeg extends LentaEvent{
  final String teg;

  RemoveTeg(this.teg);
}

class AddPosts extends LentaEvent{}
