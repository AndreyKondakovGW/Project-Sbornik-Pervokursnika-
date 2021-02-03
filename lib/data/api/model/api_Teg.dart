class ApiTeg {
  String name;
  bool selcted;

  ///метод который обрабатывет пришедьшие с бэкэнда данные
  ///(НУЖНО ПЕРЕПИСАТЬ в виде ApiTeg.fromApi(JASON)) 
  ApiTeg.fromApi(this.name,this.selcted);
}

class ApiTegList {
  List<ApiTeg> tegs;

  ///метод который обрабатывет пришедьшие с бэкэнда данные
  ///(НУЖНО ПЕРЕПИСАТЬ в виде ApiTegList.fromApi(JASON)) 
  ApiTegList.fromApi(this.tegs);
}