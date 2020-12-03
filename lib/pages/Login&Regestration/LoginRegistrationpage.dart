import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'block/formblock_bloc.dart';
import 'siginform.dart';

class LoginRegestrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(100, 149, 237, 30),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          title: Text("Вход")),
      body: Center(
          child: BlocProvider(
        create: (context) => FormblockBloc(),
        child: LoginForm(),
      )),
    );
  }
}
