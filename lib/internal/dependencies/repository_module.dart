import 'package:sbornik_pervokursnika/data/repository/Lenta_data_repository.dart';
import 'package:sbornik_pervokursnika/domain/repository/Lenta_repository.dart';

import '../../data/repository/User_data_repository.dart';
import '../../domain/repository/User_repository.dart';

import 'api_module.dart';

class RepositoryModule {
  static UserRepository _userRepository;
  static LentaRepository _lentaRepository;

  ///Функции для доступа к репозиторию(ям) из любого места в приложении
  static UserRepository userRepository() {
    if (_userRepository == null) {
      //выбор и поключение репозитория
      _userRepository = UserDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _userRepository;
  }

  static LentaRepository lentaRepository() {
    if (_lentaRepository == null) {
      //выбор и поключение репозитория
      _lentaRepository = LentaDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _lentaRepository;
  }
}
