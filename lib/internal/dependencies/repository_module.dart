import '../../data/repository/User_data_repository.dart';
import '../../domain/repository/User_repository.dart';

import 'api_module.dart';

class RepositoryModule {
  static UserRepository _userRepository;

  //Функция для доступа к репозиторию(ям) из любого места в приложении
  static UserRepository userRepository(){
    if (_userRepository == null){
      //выбор и поключение репозитория
      _userRepository = UserDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _userRepository;
  }
}