import 'package:flutter/material.dart';
import 'package:sbornik_pervokursnika/internal/dependencies/repository_module.dart';
import 'BasePage.dart';
import 'SbornikPageMenu.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (RepositoryModule.userRepository().UserIsGuest()){
      return BasePage(
        titel: 'Сборник первокурсника',
        body: SbornikMenuPage(),
      );
    }
    else{
      return NavPage();
    }
  }
}