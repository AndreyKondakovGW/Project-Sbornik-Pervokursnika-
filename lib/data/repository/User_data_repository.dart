import '../api/api_util.dart';
import '../../domain/modle/User.dart';
import '../../domain/repository/User_repository.dart';

class UserDataRepository extends UserRepository{
  final ApiUtil _apiUtil;
  
  User _currentUser = User.empty;

  UserDataRepository(this._apiUtil);

  @override
  User GetCurrentUser()
  {
    return _currentUser == User.empty? null: _currentUser;
  }

  @override
  bool UserIsGuest()
  {
    return _currentUser == User.guest;
  }

  @override
  Future<void> LogInWithNameandPassowrd({
    String username,
    String password,
  }) async{
    _currentUser = await _apiUtil.Login(usename: username, password: password);
  } 

  @override
  Future<void> Regestrate({
    String username,
    String password,
    String email,
  })async{
    _currentUser = await _apiUtil.Registrate(usename: username, password: password, email: email);
  }

  @override
  Future<void> LogInasGuest()async {
    _currentUser = User.guest;
  }
}