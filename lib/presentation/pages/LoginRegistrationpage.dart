import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/state/loginregistration/formblock_bloc.dart';
import '../Siginform.dart';
import '../WaitingWiget.dart';
import 'BasePage.dart';

class LoginRegestrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      titel: "Вход",
      body: Center(
          child: BlocProvider(
        create: (context) => FormblockBloc(),
        child: LoginBloc(),
      )),
    );
  }
}

class LoginBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FormblockBloc block = BlocProvider.of(context);
    return BlocConsumer<FormblockBloc, FormblockInitial>(
        listener: (context, state) {
      if (state.userRepository.GetCurrentUser() != null) {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    }, builder: (context, state) {
      switch (state.currstare) {
        case LoginandRegestrationState.Login:
          return LoginFormWidget(
            block: block,
            state: state,
          );
        case LoginandRegestrationState.Regestration:
          return RegistrationFormWidget(
            block: block,
            state: state,
          );
        case LoginandRegestrationState.Waiting:
          return WaitingWidget();
        default:
      }
    });
  }
}
