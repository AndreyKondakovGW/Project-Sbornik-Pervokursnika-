import 'package:meta/meta.dart';
import 'package:sbornik_pervokursnika/domain/modle/Teg.dart';

//Здесь преведены классы создающие тела запросов для бэка при работе с постами в ленте

class GetPostRequestBody
{
  final List<Teg> tegs;
  GetPostRequestBody({@required this.tegs});
  
  //Метод формирующий JASON дял отправки на бэк
  //Реализовать когда будет известно АПИ
  Map<String, dynamic> toApi() {
    return {
      'tegs' : tegs,
      'formatted' : 0,
    };
  }
}