part of 'formblock_bloc.dart';

@immutable
abstract class FormblockEvent {}

class StartRegestration extends FormblockEvent {}

class StartLogin extends FormblockEvent {}

class StartWaiting extends FormblockEvent {}

class SendSignInForm extends FormblockEvent {
  final String username;
  final String password;

  SendSignInForm({this.username, this.password});
}

class SendSignUpForm extends FormblockEvent {
  final String username;
  final String password;
  final String email;

  SendSignUpForm({this.username, this.password, this.email});
}

class LogInasGuest extends FormblockEvent {}
