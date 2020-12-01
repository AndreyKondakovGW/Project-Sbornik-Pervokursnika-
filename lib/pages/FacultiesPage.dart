import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FacultiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15, left: 15, right: 15),
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset('assets/images/mmcs.jpg').image,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(25))),
        ),
        Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.all(5),
                child: Text(
                    'Мой факультет: Институт математики, механики и компьютерных наук',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              )),
        ),
        Container(
            margin: EdgeInsets.all(20),
            color: Colors.white12,
            child: Text(
              '''
       Директор института - Карякин Михаил Игоревич	
       Зам. директора по академической политике - Чернявская Ирина Алексеевна
       Зам. директора по организации и сопровождению учебного процесса - Кряквин Вадим Донатович
       Зам. директора по социальной работе - Цывенкова Ольга Александровна
       Зам. директора по развитию магистратуры и асинхронных форм обучения - Ревина Светлана Васильевна
       Зам. директора по развитию международных образовательных проектов - Надолин Константин Аркадьевич
       Зам. директора по ИТ-​сопровождению учебной и научной деятельности - Кузьменко Семён Михайлович
       Зам. директора по научной и инновационной политике - Колесников Алексей Михайлович
       Зам. директора по академической политике - Кузнецова Елена Михайловна
       Зам. директора по общим вопросам - Качаева Александра Ивановна
       ''',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ))
      ])
    ]);
  }
}
