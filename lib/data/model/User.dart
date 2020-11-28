import 'package:meta/meta.dart';

//Класс пользователя
class User
{
  const User({
    @required this.username,
    @required this.password,
    @required this.email,
    //@required this.id,
    //@required this.photo,
  });
  final String username;
  final String password;
  final String email;
  //final String id;
  //final String photo;

  static const empty = User(username: null,password:'', email: '', /*id: '', photo: null*/);
}