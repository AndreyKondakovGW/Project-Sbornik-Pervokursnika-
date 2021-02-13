import 'package:sbornik_pervokursnika/data/api/model/api_Teg.dart';
import 'package:sbornik_pervokursnika/domain/modle/Teg.dart';

Teg tegfromApi(ApiTeg teg)
  {
    return Teg(
      name: teg.name,
      selected: teg.selcted
    );
}

class TegMapper
{
  static List<Teg> fromApi(ApiTegList tegs)
  {
    return tegs.tegs.map((t) => tegfromApi(t)).toList();
  }
}