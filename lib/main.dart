import 'package:flutter/material.dart';
import 'package:sbornik_pervokursnika/data/SignInForm/siginform.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sbornik_pervokursnika/data/bloc/formblock_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login':(BuildContext context) => LoginRegestrationPage(),
        '/home':(BuildContext context) => HomePage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}


class LoginRegestrationPage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Center(
      child: BlocProvider(
        create: (context) => FormblockBloc(),
        child: LoginForm(),
      )
      ),
    );
  }
}

class HomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Center(
      child: Text("Главная страница")
      ),
    );
  }
}