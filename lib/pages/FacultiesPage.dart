import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FacultiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 15, left: 15, right: 15),
          height: 180,
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
            child: Container(
              //padding: EdgeInsets.all(5),
              child: Container(
                padding: EdgeInsets.only(right: 10, left: 10),
                child: Text(
                    'Мой факультет: Институт математики, механики и компьютерных наук ЮФУ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Tahoma',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            )),
        Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Color.fromRGBO(100, 149, 237, 20).withOpacity(0.4),
            ),
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
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ))
      ])
    ]);
  }
}
