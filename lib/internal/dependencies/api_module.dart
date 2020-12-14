import '../../data/api/api_util.dart';
import '../../data/api/service/User_service.dart';

class ApiModule {
  static ApiUtil _apiUtil;

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      //Задаём к какому сервису(ам) нужно подключить ApiUtil
      _apiUtil = ApiUtil(UserServicePlug());

    }
    return _apiUtil;
  }
  
}