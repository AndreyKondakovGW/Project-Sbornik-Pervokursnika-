import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';

import '../../modle/FormInput.dart';
import 'package:sbornik_pervokursnika/domain/repository/User_repository.dart';
import '../../../internal/dependencies/repository_module.dart';
import '../../errors/LoginandRegestrationErrors.dart';
part 'formblock_state.dart';
part 'formblock_event.dart';



class FormblockBloc extends Bloc<FormblockEvent,FormblockInitial> {
  FormblockBloc() : super(FormblockInitial());

  @override
  Stream<FormblockInitial> mapEventToState(
    FormblockEvent event,
  ) async* {
    if (event is StartLogin)
    {
      yield FormblockInitial(currstare: LoginandRegestrationState.Login);
    }
    if (event is StartRegestration)
    {
      yield FormblockInitial(currstare: LoginandRegestrationState.Regestration);
    }
    if (event is StartWaiting)
    {
      yield FormblockInitial(currstare: LoginandRegestrationState.Waiting);
    }

    if(event is SendSignInForm)
    {
      if (state.siginInusername.key.currentState.validate() && state.siginInpassword.key.currentState.validate())
      {
        try{
          yield FormblockInitial(currstare: LoginandRegestrationState.Waiting);
          await state.userRepository.LogInWithNameandPassowrd(username: event.username, password: event.password);
          yield FormblockInitial(currstare: LoginandRegestrationState.Login);
        }on TextExeption catch(e)
        {
          yield FormblockInitial(
            errorrequest: true,
            errortext: e.text,
            currstare: LoginandRegestrationState.Login,
          );
        }
      }
    }
    if (event is SendSignUpForm)
    {
      if (state.siginUpusername.key.currentState.validate() && state.siginUppassword.key.currentState.validate() && state.siginUpemail.key.currentState.validate())
      {
        try{
          yield FormblockInitial(currstare: LoginandRegestrationState.Waiting);
          await state.userRepository.Regestrate(username: event.username, password: event.password, email: event.email);
          yield FormblockInitial(currstare: LoginandRegestrationState.Regestration);
        }on TextExeption catch(e)
        {
          yield FormblockInitial(
            errorrequest: true,
            errortext: e.text,
            currstare: LoginandRegestrationState.Regestration,
          );
        }
      }
    }
    if (event is LogInasGuest)
    {
      try{
        yield FormblockInitial(currstare: LoginandRegestrationState.Waiting);
        await state.userRepository.LogInasGuest();
        yield FormblockInitial(currstare: LoginandRegestrationState.Regestration);
      }on TextExeption catch(e)
        {
          yield FormblockInitial(
            errorrequest: true,
            errortext: e.text,
            currstare: LoginandRegestrationState.Regestration,
          );
        }
    }
  }
}
