class ApiUser {
  final String username;
  final String password;
  final String email;

  ///метод который обрабатывет пришедьшие с бэкэнда данные
  ///(НУЖНО ПЕРЕПИСАТЬ) 
  ApiUser.fromApi({this.username,this.password,this.email});
}