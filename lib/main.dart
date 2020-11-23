import 'package:flutter/material.dart';
import 'package:sbornik_pervokursnika/data/SignInForm/siginform.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sbornik_pervokursnika/data/SignInForm/bloc/sigininblock_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("title"),
        ),
        body: Center(

          /*TODO во отдельном классе создать виджет который вы выбрали для работы над
          для отображения просто замените строчку child: Text("Prject App"),  на child: MyWidget(),
          Состояния виджетов следует хранить в отдельных файлах как это было обговоренно на собрании.
          Список Виджетов для работы над:
            1)Виджет Поста из ленты (Пока будем отображать с помощью ListView)
            Пример child: ListView(children: Posts.map((post) => PostWidget(post)).toList(),),
            2)Виджет Разделов Сборника первокурсника
            3)Виджет Списка подразделов Сборника
            4)Виджет Профиля студента/факультета (попыться сделать их едино образно)
            5)Виджет Отображения статьи из сборника
          */
          child: BlocProvider(
            create: (context) => SigininCubit(),
            child: LoginForm(),
          )
          
        ),
      ),
    );
  }
}
