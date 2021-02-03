import 'package:sbornik_pervokursnika/data/api/service/Lenta_service.dart';

import '../../data/api/api_util.dart';
import '../../data/api/service/User_service.dart';

class ApiModule {
  static ApiUtil _apiUtil;

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      //Задаём к какому сервису(ам) нужно подключить ApiUtil
      _apiUtil = ApiUtil(UserServicePlug(), LentaServicePlug());

    }
    return _apiUtil;
  }
  
}