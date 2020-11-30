import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sbornik_pervokursnika/data/SignFormblock/formblock_bloc.dart';
import 'package:sbornik_pervokursnika/data/SignInForm/siginform.dart';

class LoginRegestrationPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Вход")),
      body: Center(
        child: BlocProvider(
          create: (context) => FormblockBloc(),
          child: LoginForm(),
        )
      ),
    );
  }
}